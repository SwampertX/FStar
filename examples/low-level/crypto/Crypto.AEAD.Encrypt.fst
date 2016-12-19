module Crypto.AEAD.Encrypt
open FStar.UInt32
open FStar.Ghost
open Buffer.Utils
open FStar.Monotonic.RRef

open Crypto.Indexing
open Crypto.Symmetric.Bytes
open Crypto.Plain
open Flag

open Crypto.Symmetric.PRF
open Crypto.AEAD.Encoding 
open Crypto.AEAD.Invariant

module HH       = FStar.HyperHeap
module HS       = FStar.HyperStack
module MAC      = Crypto.Symmetric.MAC
module CMA      = Crypto.Symmetric.UF1CMA
module Plain    = Crypto.Plain
module Cipher   = Crypto.Symmetric.Cipher
module PRF      = Crypto.Symmetric.PRF
module Enxor    = Crypto.AEAD.EnxorDexor
module PRF_MAC     = Crypto.AEAD.PRF_MAC
module Encoding    = Crypto.AEAD.Encoding   
module EncodingWrapper = Crypto.AEAD.Wrappers.Encoding
module CMAWrapper = Crypto.AEAD.Wrappers.CMA

assume //NS: boring, this should be in the buffer library
val to_seq_temp: #a:Type -> b:Buffer.buffer a -> l:UInt32.t{v l <= Buffer.length b} -> ST (Seq.seq a)
  (requires (fun h -> Buffer.live h b))
  (ensures  (fun h0 r h1 -> h0 == h1 /\ Buffer.live h1 b /\ r == Buffer.as_seq h1 b))

#reset-options "--z3rlimit 40 --initial_fuel 0 --max_fuel 0 --initial_ifuel 0 --max_ifuel 0"
let ideal_ensures
	 (#i: id)
 	 (st: aead_state i Writer)
          (n: Cipher.iv (alg i))
    (#aadlen: aadlen_32)
        (aad: lbuffer (v aadlen))
  (#plainlen: txtlen_32)
      (plain: plainBuffer i (v plainlen))
  (cipher_tag: lbuffer (v plainlen + v MAC.taglen){safeMac i})
       (h0 h1: mem) = 
    enc_dec_liveness st aad plain cipher_tag h0 /\
    enc_dec_liveness st aad plain cipher_tag h1 /\
    HS.(h0.tip = h1.tip) /\
    HS.modifies (Set.as_set [st.log_region]) h0 h1 /\
    HS.modifies_ref st.log_region (TSet.singleton (HS.as_aref (st_ilog st))) h0 h1 /\ (
    let entry = AEADEntry n (Buffer.as_seq h0 aad) 
 			    (v plainlen)
			    (Plain.sel_plain h0 plainlen plain)
			    (Buffer.as_seq h0 cipher_tag) in
    let log = st_ilog st in 				      
    HS.sel h1 log == SeqProperties.snoc (HS.sel h0 log) entry)

val do_ideal:
	 #i: id -> 
 	 st: aead_state i Writer ->
          n: Cipher.iv (alg i) ->
    #aadlen: aadlen_32 ->
        aad: lbuffer (v aadlen) ->
  #plainlen: txtlen_32 ->
      plain: plainBuffer i (v plainlen) ->
 cipher_tag: lbuffer (v plainlen + v MAC.taglen){safeMac i} ->
         ST  unit
 (requires (fun h -> 
	    enc_dec_liveness st aad plain cipher_tag h))
 (ensures  (fun h0 _ h1 ->
	    ideal_ensures st n aad plain cipher_tag h0 h1))
let do_ideal #i st n #aadlen aad #plainlen plain cipher_tag =
    let ad = to_seq_temp aad aadlen in
    let p = Plain.load plainlen plain in 
    let c_tagged = to_seq_temp cipher_tag plainlen in
    let entry = AEADEntry n ad (v plainlen) p c_tagged in
    FStar.ST.recall (st_ilog st);
    st_ilog st := SeqProperties.snoc !(st_ilog st) entry

#reset-options "--z3rlimit 400 --initial_fuel 0 --max_fuel 0 --initial_ifuel 0 --max_ifuel 0"
let encrypt_ensures  (#i:id) (st:aead_state i Writer)
		     (n: Cipher.iv (alg i))
		     (#aadlen:aadlen)
		     (aad: lbuffer (v aadlen))
		     (#plainlen: UInt32.t)
		     (plain: plainBuffer i (v plainlen))
		     (cipher_tagged:lbuffer (v plainlen + v MAC.taglen))
		     (h0:mem) (h1:mem) = 
    enc_dec_liveness st aad plain cipher_tagged h1 /\
    (safeMac i ==>  (
       let aad = Buffer.as_seq h1 aad in
       let p = Plain.sel_plain h1 plainlen plain in
       let c = Buffer.as_seq h1 cipher_tagged in
       HS.sel h1 st.log == SeqProperties.snoc (HS.sel h0 st.log) (AEADEntry n aad (v plainlen) p c)))

let encrypt_modifies (#i:id) (st:aead_state i Writer)
		     (#plainlen: UInt32.t)
		     (cipher_tagged:lbuffer (v plainlen + v MAC.taglen))
		     (h0:mem) (h1:mem) : GTot Type0 = 
  HS.modifies_transitively (Set.as_set [st.log_region; Buffer.frameOf cipher_tagged]) h0 h1 /\
  Buffer.modifies_buf_1 (Buffer.frameOf cipher_tagged) cipher_tagged h0 h1

val encrypt_write_effect : 
          i: id -> 
         st: aead_state i Writer ->
          n: Cipher.iv (alg i) ->
    #aadlen: aadlen_32 ->
        aad: lbuffer (v aadlen) ->
  #plainlen: nz_ok_len_32 i ->
      plain: plainBuffer i (v plainlen) ->
 cipher_tag: lbuffer (v plainlen + v MAC.taglen) ->
         ak: CMA.state (i, n) -> 
        acc: CMA.accBuffer (i, n) ->
     h_init: mem ->
     h_push: mem ->
      h_prf: mem ->
      h_enx: mem ->
      h_acc: mem ->
      h_mac: mem ->
    h_ideal: mem ->
      Lemma  
  (requires  (let open HS in
	      let cipher : lbuffer (v plainlen) = Buffer.sub cipher_tag 0ul plainlen in
 	      let tag : lbuffer (v MAC.taglen) = Buffer.sub cipher_tag plainlen MAC.taglen in
	      let x_1 = {iv=n; ctr=otp_offset i} in
	      CMA.(ak.region) = PRF.(st.prf.mac_rgn) /\	      
	      enc_dec_separation st aad plain cipher_tag  /\
              enc_dec_liveness st aad plain cipher_tag h_init /\
              enc_dec_liveness st aad plain cipher_tag h_push /\
              enc_dec_liveness st aad plain cipher_tag h_prf /\
              enc_dec_liveness st aad plain cipher_tag h_enx /\
              enc_dec_liveness st aad plain cipher_tag h_acc /\
              enc_dec_liveness st aad plain cipher_tag h_mac /\	      
              enc_dec_liveness st aad plain cipher_tag h_ideal /\
	      fresh_frame h_init h_push /\
	      BufferUtils.prf_mac_modifies st.log_region st.prf.mac_rgn h_push h_prf /\
	      Enxor.modifies_table_above_x_and_buffer st.prf x_1 cipher h_prf h_enx /\
	      EncodingWrapper.accumulate_modifies_nothing h_enx h_acc /\
	      Buffer.frameOf (MAC.as_buffer (CMA.abuf acc)) = h_acc.tip /\
	      CMAWrapper.mac_modifies i n tag ak acc h_acc h_mac /\
	      h_acc.tip = h_mac.tip /\
	      h_mac.tip = h_ideal.tip /\
	      (if not (safeMac i)
 	       then h_mac == h_ideal 
	       else ideal_ensures st n aad plain cipher_tag h_mac h_ideal)))
   (ensures  (HS.poppable h_ideal /\ (
	      let h_final = HS.pop h_ideal in
	      encrypt_ensures st n aad plain cipher_tag h_init h_final /\
	      encrypt_modifies st cipher_tag h_init h_final)))
#reset-options "--z3rlimit 400 --initial_fuel 0 --max_fuel 0 --initial_ifuel 0 --max_ifuel 0"
let encrypt_write_effect i st n #aadlen aad #plainlen plain cipher_tag ak acc
			 h_init h_push h_prf h_enx h_acc h_mac h_ideal =
			 
  let open HS in			 
  let abuf = MAC.as_buffer (CMA.abuf acc) in
  let cipher : lbuffer (v plainlen) = Buffer.sub cipher_tag 0ul plainlen in
  let tag : lbuffer (v MAC.taglen) = Buffer.sub cipher_tag plainlen MAC.taglen in
  let x_1 = {iv=n; ctr=otp_offset i} in
  let mac_region = PRF.(st.prf.mac_rgn) in
  assume (safeMac i ==>  (
    HS.sel h_init (st_ilog st) == HS.sel h_mac (st_ilog st)));
  Enxor.weaken_modifies st.prf x_1 cipher h_prf h_enx;
  CMAWrapper.weaken_mac_modifies i n tag ak acc h_acc h_mac;
  BufferUtils.chain_mods_enc abuf (not (safeMac i)) st.log_region PRF.(st.prf.mac_rgn) cipher_tag
			     h_init h_push h_prf h_enx h_acc h_mac h_ideal

val reestablish_inv:
          i: id -> 
         st: aead_state i Writer ->
          n: Cipher.iv (alg i) ->
    #aadlen: aadlen_32 ->
        aad: lbuffer (v aadlen) ->
  #plainlen: nz_ok_len_32 i ->
      plain: plainBuffer i (v plainlen) ->
 cipher_tag: lbuffer (v plainlen + v MAC.taglen) ->
         ak: CMA.state (i, n) -> 
        acc: CMA.accBuffer (i, n) ->
         h0: mem ->
         h1: mem ->
         h2: mem ->
         h3: mem ->       
         h4: mem ->               
      Lemma 
  (requires  (let cipher : lbuffer (v plainlen) = Buffer.sub cipher_tag 0ul plainlen in
              (* let x_1 = {iv=n; ctr=otp_offset i} in *)
              enc_dec_separation st aad plain cipher_tag  /\
              enc_dec_liveness st aad plain cipher_tag h0 /\
              (* enc_dec_liveness st aad plain cipher_tag h1 /\ *)
              (* enc_dec_liveness st aad plain cipher_tag h2 /\ *)
              (* enc_dec_liveness st aad plain cipher_tag h3 /\ *)
	      HS.(is_stack_region h0.tip) /\ //TODO: need to add that the buffers of acc live in h0.tip
              inv st h0 /\
	      (safeMac i ==> is_mac_for_iv st ak h0) /\
              PRF_MAC.enxor_h0_h1 st n aad plain cipher_tag h0 h1 /\
              (* Enxor.enxor_invariant st.prf x_1 plainlen 0ul plain cipher h0 h1 /\ *)
              (* Enxor.modifies_table_above_x_and_buffer st.prf x_1 cipher h0 h1 /\ *)
              EncodingWrapper.accumulate_modifies_nothing h1 h2 /\
              CMAWrapper.mac_ensures i n st aad plain cipher_tag ak acc h2 h3 /\ (
              if safeMac i
              then ideal_ensures st n aad plain cipher_tag h3 h4
              else h3 == h4)))
  (ensures    (inv st h4))
let reestablish_inv i st n #aadlen aad #plainlen plain cipher_tag ak acc h0 h1 h2 h3 h4 =
  let cipher : lbuffer (v plainlen) = Buffer.sub cipher_tag 0ul plainlen in
  PRF_MAC.lemma_propagate_inv_enxor st n aad plain cipher_tag h0 h1;
  (* assert (PRF_MAC.enxor_post st n aad plain cipher h1); *)
  FStar.Buffer.lemma_intro_modifies_0 h1 h2;
  (* assert (PRF_MAC.accumulate_h0_h1 st n aad plain cipher h1 h2); *)
  PRF_MAC.lemma_propagate_inv_accumulate false st n aad plain cipher_tag h1 h2;
  admit()

////////////////////////////////////////////////////////////////////////////////
       
val encrypt:
          i: id -> 
 	 st: aead_state i Writer ->
          n: Cipher.iv (alg i) ->
     aadlen: aadlen_32 ->
        aad: lbuffer (v aadlen) ->
   plainlen: nz_ok_len_32 i ->
      plain: plainBuffer i (v plainlen) ->
 cipher_tag: lbuffer (v plainlen + v MAC.taglen) ->
         ST  unit
  (requires (fun h ->
	     enc_dec_separation st aad plain cipher_tag /\
	     enc_dec_liveness st aad plain cipher_tag h /\
	     (safeMac i ==> fresh_nonce_st n st h) /\
	     inv st h))
   (ensures (fun h0 _ h1 ->
	      encrypt_ensures st n aad plain cipher_tag h0 h1 /\
	      encrypt_modifies st cipher_tag h0 h1 /\
 	      inv st h1))

let encrypt i st n aadlen aad plainlen plain cipher_tagged =
  let h_init = get() in
  push_frame(); 
  let h_push = get () in
  frame_inv_push st h_init h_push; //inv st h0

  let cipher : lbuffer (v plainlen) = Buffer.sub cipher_tagged 0ul plainlen in
  let tag = Buffer.sub cipher_tagged plainlen MAC.taglen in
  let x_0 = PRF.({iv = n; ctr = ctr_0 i}) in // PRF index to the first block

  //call prf_mac: get a mac key, ak
  let ak = PRF_MAC.prf_mac_enc st aad plain cipher_tagged st.ak x_0 in  // used for keying the one-time MAC
  let h_prf = get () in
  let open CMA in 

  //call enxor: fragment the plaintext, call the prf, and fill in the cipher text
  Enxor.enxor n st aad plain cipher_tagged ak;
  let h_enxor = get () in
  
  (* assume (EncodingWrapper.ak_aad_cipher_separate ak aad cipher_tagged); //slow *)

  //call accumulate: encode the ciphertext and additional data for mac'ing
  let acc = EncodingWrapper.accumulate_enc #(i, n) st ak aad plain cipher_tagged in
  let h_acc = get () in

  (* assume(verify_liveness ak tag h_acc); //slow *)

  //call mac: filling in the tag component of the out buffer
  CMAWrapper.mac #(i,n) st aad plain cipher_tagged ak acc h_enxor;
  let h_mac = get () in

  (* assert (safeMac i ==> fresh_nonce_st n st h_mac); *)

  if safeMac i
  then do_ideal st n aad plain cipher_tagged;
  let h_ideal = get () in
  reestablish_inv i st n aad plain cipher_tagged ak acc h_prf h_enxor h_acc h_mac h_ideal;
  encrypt_write_effect i st n aad plain cipher_tagged ak acc h_init h_push h_prf h_enxor h_acc h_mac h_ideal;
  frame_inv_pop st h_ideal;
  pop_frame()
