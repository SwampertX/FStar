%{
(*
 Known (intentional) ambiguities: 8 s/r conflicts in total; resolved by shifting
   4 s/r conflicts on BAR
      function | P -> match with | Q -> _ | R -> _
      function | P -> function ...  (x 2)
      function | P -> try e with | ...

   1 s/r conflict on SEMICOLON
       fun x -> e1 ; e2
     is parsed as
        (fun x -> e1; e2)
     rather than
        (fun x -> e1); e2

   2 s/r conflict on DOT
      A.B ^ .C  (x 2)

   1 s/r conflict on LBRACE

      Consider:
          let f (x: y:int & z:vector y{z=z /\ y=0}) = 0

      This is parsed as:
        let f (x: (y:int & z:vector y{z=z /\ y=0})) = 0
      rather than:
        let f (x: (y:int & z:vector y){z=z /\ y=0}) = 0

      Analogous ambiguities with -> and * as well.

 A lot (142) of end-of-stream conflicts are also reported and
 should be investigated...
*)
(* (c) Microsoft Corporation. All rights reserved *)
open Prims
open FStar_List
open FStar_Util
open FStar_Range
open FStar_Options
(* TODO : these files should be deprecated and removed *)
open FStar_Absyn_Syntax
open FStar_Absyn_Const
open FStar_Absyn_Util
open FStar_Parser_AST
open FStar_Parser_Util
open FStar_Const
open FStar_Ident
open FStar_String

let as_frag d ds =
    let rec as_mlist out ((m,r,doc), cur) ds =
    match ds with
    | [] -> List.rev (Module(m, (mk_decl (TopLevelModule(m)) r doc) ::(List.rev cur))::out)
    | d::ds ->
      begin match d.d with
        | TopLevelModule m' ->
				as_mlist (Module(m, (mk_decl (TopLevelModule(m)) r doc) :: (List.rev cur))::out) ((m',d.drange,d.doc), []) ds
        | _ -> as_mlist out ((m,r,doc), d::cur) ds
      end in
    match d.d with
    | TopLevelModule m ->
        let ms = as_mlist [] ((m,d.drange,d.doc), []) ds in
        begin match ms with
        | _::Module(n, _)::_ ->
		(* This check is coded to hard-fail in dep.num_of_toplevelmods. *)
        let msg = "Support for more than one module in a file is deprecated" in
        print2_warning "%s (Warning): %s\n" (string_of_range (range_of_lid n)) msg
        | _ -> ()
        end;
        Inl ms
    | _ ->
        let ds = d::ds in
        iter (function {d=TopLevelModule _; drange=r} -> raise (Error("Unexpected module declaration", r))
                       | _ -> ()) ds;
        Inr ds

let compile_op arity s =
    let name_of_char = function
            |'&' -> "Amp"
            |'@'  -> "At"
            |'+' -> "Plus"
            |'-' when (arity=1) -> "Minus"
            |'-' -> "Subtraction"
            |'/' -> "Slash"
            |'<' -> "Less"
            |'=' -> "Equals"
            |'>' -> "Greater"
            |'_' -> "Underscore"
            |'|' -> "Bar"
            |'!' -> "Bang"
            |'^' -> "Hat"
            |'%' -> "Percent"
            |'*' -> "Star"
            |'?' -> "Question"
            |':' -> "Colon"
            | _ -> "UNKNOWN"
    in
    match s with
    | ".[]<-" -> "op_String_Assignment"
    | ".()<-" -> "op_Array_Assignment"
    | ".[]" -> "op_String_Access"
    | ".()" -> "op_Array_Access"
    | _ -> "op_"^ (concat "_" (map name_of_char (list_of_string s)))
%}

%token <bytes> BYTEARRAY
%token <bytes> STRING
%token <string> IDENT
%token <string> NAME
%token <string> TVAR
%token <string> UNIVAR
%token <string> TILDE

/* bool indicates if INT8 was 'bad' max_int+1, e.g. '128'  */
%token <string * bool> INT8
%token <string * bool> INT16
%token <string * bool> INT32
%token <string * bool> INT64
%token <string * bool> INT

%token <string> UINT8
%token <string> UINT16
%token <string> UINT32
%token <string> UINT64
%token <float> IEEE64
%token <char> CHAR
%token <bool> LET
%token <FStar_Parser_AST.fsdoc> FSDOC
%token <FStar_Parser_AST.fsdoc> FSDOC_STANDALONE

%token FORALL EXISTS ASSUME NEW LOGIC ATTRIBUTES
%token IRREDUCIBLE UNFOLDABLE INLINE OPAQUE ABSTRACT UNFOLD INLINE_FOR_EXTRACTION
%token NOEXTRACT
%token NOEQUALITY UNOPTEQUALITY PRAGMALIGHT PRAGMA_SET_OPTIONS PRAGMA_RESET_OPTIONS
%token ACTIONS TYP_APP_LESS TYP_APP_GREATER SUBTYPE SUBKIND
%token AND ASSERT BEGIN ELSE END
%token EXCEPTION FALSE L_FALSE FUN FUNCTION IF IN MODULE DEFAULT
%token MATCH OF
%token OPEN REC MUTABLE THEN TRUE L_TRUE TRY TYPE EFFECT VAL
%token WHEN WITH HASH AMP LPAREN RPAREN LPAREN_RPAREN COMMA LARROW RARROW
%token IFF IMPLIES CONJUNCTION DISJUNCTION
%token DOT COLON COLON_COLON SEMICOLON
%token QMARK_DOT
%token QMARK
%token SEMICOLON_SEMICOLON EQUALS PERCENT_LBRACK DOT_LBRACK DOT_LPAREN LBRACK LBRACK_BAR LBRACE BANG_LBRACE
%token BAR_RBRACK UNDERSCORE LENS_PAREN_LEFT LENS_PAREN_RIGHT
%token BAR RBRACK RBRACE DOLLAR
%token PRIVATE REIFIABLE REFLECTABLE REIFY LBRACE_COLON_PATTERN PIPE_RIGHT
%token NEW_EFFECT NEW_EFFECT_FOR_FREE SUB_EFFECT SQUIGGLY_RARROW TOTAL KIND
%token REQUIRES ENSURES
%token MINUS COLON_EQUALS
%token BACKTICK UNIV_HASH

%token<string>  OPPREFIX OPINFIX0a OPINFIX0b OPINFIX0c OPINFIX0d OPINFIX1 OPINFIX2 OPINFIX3 OPINFIX4

/* These are artificial */
%token EOF

%nonassoc THEN
%nonassoc ELSE


/********************************************************************************/
/* TODO : check that precedence of the following section mix well with the rest */

(* %right IFF *)
(* %right IMPLIES *)

(* %left DISJUNCTION *)
(* %left CONJUNCTION *)

%right COLON_COLON
%right AMP
/********************************************************************************/

%nonassoc COLON_EQUALS
%left     OPINFIX0a
%left     OPINFIX0b
%left     OPINFIX0c EQUALS
%left     OPINFIX0d
%left     PIPE_RIGHT
%right    OPINFIX1
%left     OPINFIX2 MINUS
%left     OPINFIX3
%left     BACKTICK
%right    OPINFIX4

%start inputFragment
%start term
%type <inputFragment> inputFragment
%type <term> term

%type <FStar_Ident.ident> lident

%%

(* inputFragment is used at the same time for whole files and fragment of codes (for interactive mode) *)
inputFragment:
  | option(PRAGMALIGHT STRING {}) d=decl decls=list(decl) main_opt=mainDecl? EOF
       {
         let decls = match main_opt with
           | None -> decls
           | Some main -> decls @ [main]
         in as_frag d decls
       }

(* TODO : let's try to remove that *)
mainDecl:
  | SEMICOLON_SEMICOLON doc_opt=FSDOC? t=term
      { mk_decl (Main t) (rhs2 parseState 1 3) doc_opt }


/******************************************************************************/
/*                      Top level declarations                                */
/******************************************************************************/

pragma:
  | PRAGMA_SET_OPTIONS s=string
      { SetOptions s }
  | PRAGMA_RESET_OPTIONS s_opt=string?
      { ResetOptions s_opt }

decl:
  | fsdoc_opt=FSDOC? decl=decl2 { mk_decl decl (rhs parseState 2) fsdoc_opt }

decl2:
  | OPEN uid=quident
      { Open uid }
  | MODULE uid1=uident EQUALS uid2=quident
      {  ModuleAbbrev(uid1, uid2) }
  | MODULE uid=quident
      {  TopLevelModule uid }
  | k=kind_abbrev  (* TODO : Remove with stratify *)
      { k }
  | qs=qualifiers TYPE tcdefs=separated_nonempty_list(AND,pair(option(FSDOC), typeDecl))
      { Tycon (qs, List.map (fun (doc, f) -> (f, doc)) tcdefs) }
  | qs=qualifiers EFFECT uid=uident tparams=typars EQUALS t=typ
      { Tycon(Effect::qs, [TyconAbbrev(uid, tparams, None, t), None]) }
  (* change to menhir : let ~> rec changed to let rec ~> *)
  | qs=qualifiers LET q=letqualifier lbs=separated_nonempty_list(AND, letbinding)
      {
        let lbs = focusLetBindings lbs (rhs2 parseState 1 4) in
        TopLevelLet(qs, q, lbs)
      }
  | qs=qualifiers VAL lid=lidentOrOperator bss=list(multiBinder) COLON t=typ
      {
        let t = match flatten bss with
          | [] -> t
          | bs -> mk_term (Product(bs, t)) (rhs2 parseState 4 6) Type
        in Val(qs, lid, t)
      }
  | ASSUME lid=uident COLON phi=formula (* TODO : Remove with stratify *)
      { Assume([Assumption], lid, phi) }
  | EXCEPTION lid=uident t_opt=option(OF t=typ {t})
      { Exception(lid, t_opt) }
  | qs=qualifiers NEW_EFFECT ne=newEffect
      { NewEffect (qs, ne) }
  | qs=qualifiers SUB_EFFECT se=subEffect
      { SubEffect se } (* TODO (KM) : Why are we dropping the qualifiers here ? Does that mean we should not accept them ? *)
  | qs=qualifiers NEW_EFFECT_FOR_FREE ne=newEffect
      { NewEffectForFree (qs, ne) }
  | p=pragma
      { Pragma p }
  | doc=FSDOC_STANDALONE
      { Fsdoc doc }

typeDecl:
  (* TODO : change to lident with stratify *)
  | lid=ident tparams=typars ascr_opt=ascribeKind? tcdef=typeDefinition
      { tcdef lid tparams ascr_opt }

typars:
  | x=tvarinsts              { x }
  | x=binders                { x }

tvarinsts:
  | TYP_APP_LESS tvs=separated_nonempty_list(COMMA, tvar) TYP_APP_GREATER
      { map (fun tv -> mk_binder (TVariable(tv)) tv.idRange Kind None) tvs }

typeDefinition:
  |   { (fun id binders kopt -> check_id id; TyconAbstract(id, binders, kopt)) }
  | EQUALS t=typ
      { (fun id binders kopt ->  check_id id; TyconAbbrev(id, binders, kopt, t)) }
  /* A documentation on the first branch creates a conflict with { x with a = ... }/{ a = ... } */
  | EQUALS LBRACE
      record_field_decls=right_flexible_nonempty_list(SEMICOLON, recordFieldDecl)
   RBRACE
      { (fun id binders kopt -> check_id id; TyconRecord(id, binders, kopt, record_field_decls)) }
  (* having the first BAR optional using left-flexible list creates a s/r on FSDOC since any decl can be preceded by a FSDOC *)
  | EQUALS ct_decls=list(constructorDecl)
      { (fun id binders kopt -> check_id id; TyconVariant(id, binders, kopt, ct_decls)) }

recordFieldDecl:
  |  doc_opt=ioption(FSDOC) lid=lident COLON t=typ
      { (lid, t, doc_opt) }

constructorDecl:
  | BAR doc_opt=FSDOC? uid=uident COLON t=typ                { (uid, Some t, doc_opt, false) }
  | BAR doc_opt=FSDOC? uid=uident t_opt=option(OF t=typ {t}) { (uid, t_opt, doc_opt, true) }

(* TODO : Remove with stratify *)
kind_abbrev:
  | KIND lid=ident bs=binders EQUALS k=kind
      { KindAbbrev(lid, bs, k) }

letbinding:
  | focus_opt=maybeFocus lid=lidentOrOperator lbp=nonempty_list(patternOrMultibinder) ascr_opt=ascribeTyp? EQUALS tm=term
      {
        let pat = mk_pattern (PatVar(lid, None)) (rhs parseState 2) in
        let pat = mk_pattern (PatApp (pat, flatten lbp)) (rhs2 parseState 1 3) in
        let pos = rhs2 parseState 1 6 in
        match ascr_opt with
        | None -> (focus_opt, (pat, tm))
        | Some t -> (focus_opt, (mk_pattern (PatAscribed(pat, t)) pos, tm))
      }
  | focus_opt=maybeFocus pat=tuplePattern ascr=ascribeTyp EQUALS tm=term
      { focus_opt, (mk_pattern (PatAscribed(pat, ascr)) (rhs2 parseState 1 4), tm) }
  | focus_opt=maybeFocus pat=tuplePattern EQUALS tm=term
      { focus_opt, (pat, tm) }

/******************************************************************************/
/*                                Effects                                     */
/******************************************************************************/

newEffect:
  | ed=effectRedefinition
  | ed=effectDefinition
       { ed }

effectRedefinition:
  | lid=uident EQUALS t=simpleTerm
      { RedefineEffect(lid, [], t) }

effectDefinition:
  | LBRACE lid=uident bs=binders COLON k=kind
    	   WITH eds=separated_nonempty_list(SEMICOLON, effectDecl)
         actions=actionDecls
    RBRACE
      {
         DefineEffect(lid, bs, k, eds, actions)
      }

actionDecls:
  |   { [] }
  | AND ACTIONS actions=separated_list(SEMICOLON, effectDecl)
      { actions }

effectDecl:
  | lid=lident EQUALS t=simpleTerm
     { mk_decl (Tycon ([], [TyconAbbrev(lid, [], None, t), None])) (rhs2 parseState 1 3) None }

subEffect:
  | src_eff=quident SQUIGGLY_RARROW tgt_eff=quident EQUALS lift=simpleTerm
      { { msource = src_eff; mdest = tgt_eff; lift_op = NonReifiableLift lift } }
  | src_eff=quident SQUIGGLY_RARROW tgt_eff=quident
    LBRACE
      lift1=separated_pair(IDENT, EQUALS, simpleTerm)
      lift2_opt=ioption(separated_pair(SEMICOLON id=IDENT {id}, EQUALS, simpleTerm))
      /* might be nice for homogeneity if possible : ioption(SEMICOLON) */
    RBRACE
     {
       match lift2_opt with
       | None ->
          begin match lift1 with
          | ("lift", lift) ->
             { msource = src_eff; mdest = tgt_eff; lift_op = LiftForFree lift }
          | ("lift_wp", lift_wp) ->
             { msource = src_eff; mdest = tgt_eff; lift_op = NonReifiableLift lift_wp }
          | _ ->
             raise (Error("Unexpected identifier; expected {'lift', and possibly 'lift_wp'}", lhs parseState))
          end
       | Some (id2, tm2) ->
          let (id1, tm1) = lift1 in
          let lift, lift_wp = match (id1, id2) with
	          | "lift_wp", "lift" -> tm1, tm2
	          | "lift", "lift_wp" -> tm2, tm1
	          | _ -> raise (Error("Unexpected identifier; expected {'lift', 'lift_wp'}", lhs parseState))
          in
          { msource = src_eff; mdest = tgt_eff; lift_op = ReifiableLift (lift, lift_wp) }
     }


/******************************************************************************/
/*                        Qualifiers, tags, ...                               */
/******************************************************************************/

qualifier:
  | ASSUME        { Assumption }
  | INLINE        {
    raise (Error("The 'inline' qualifier has been renamed to 'unfold'", lhs parseState))
   }
  | UNFOLDABLE    {
	      raise (Error("The 'unfoldable' qualifier is no longer denotable; it is the default qualifier so just omit it", lhs parseState))
   }
  | INLINE_FOR_EXTRACTION {
     Inline_for_extraction
  }
  | UNFOLD {
     Unfold_for_unification_and_vcgen
  }
  | IRREDUCIBLE   { Irreducible }
  | NOEXTRACT     { NoExtract }
  | DEFAULT       { DefaultEffect }
  | TOTAL         { TotalEffect }
  | PRIVATE       { Private }
  | ABSTRACT      { Abstract }
  | NOEQUALITY    { Noeq }
  | UNOPTEQUALITY { Unopteq }
  | NEW           { New }
  | LOGIC         { Logic }
  | OPAQUE        { Opaque }
  | REIFIABLE     { Reifiable }
  | REFLECTABLE   { Reflectable }

%inline qualifiers:
  | qs=list(qualifier) { qs }

maybeFocus:
  | b=boption(SQUIGGLY_RARROW) { b }

letqualifier:
  | REC         { Rec }
  | MUTABLE     { Mutable }
  |             { NoLetQualifier }

 (* Remove with stratify *)
aqual:
  | EQUALS    { if universes()
                then print1 "%s (Warning): The '=' notation for equality constraints on binders is deprecated; use '$' instead\n" (string_of_range (lhs parseState));
				        Equality }
  | q=aqualUniverses { q }

aqualUniverses:
  | HASH      { Implicit }
  | DOLLAR    { Equality }

/******************************************************************************/
/*                         Patterns, binders                                  */
/******************************************************************************/

(* disjunction should be allowed in nested patterns *)
disjunctivePattern:
  | pats=separated_nonempty_list(BAR, tuplePattern) { pats }

tuplePattern:
  | pats=separated_nonempty_list(COMMA, constructorPattern)
      { match pats with | [x] -> x | l -> mk_pattern (PatTuple (l, false)) (rhs parseState 1) }

constructorPattern:
  | pat=constructorPattern COLON_COLON pats=constructorPattern
      { mk_pattern (consPat (rhs parseState 3) pat pats) (rhs2 parseState 1 3) }
  | uid=quident args=nonempty_list(atomicPattern)
      {
        let head_pat = mk_pattern (PatName uid) (rhs parseState 1) in
        mk_pattern (PatApp (head_pat, args)) (rhs2 parseState 1 2)
      }
  | pat=atomicPattern
      { pat }

atomicPattern:
  | LPAREN pat=tuplePattern COLON t=typ phi_opt=refineOpt RPAREN
      {
        let pos_t = rhs2 parseState 2 4 in
        let pos = rhs2 parseState 1 6 in
        mkRefinedPattern pat t true phi_opt pos_t pos
      }
  | LBRACK pats=separated_list(SEMICOLON, tuplePattern) RBRACK
      { mk_pattern (PatList pats) (rhs2 parseState 1 3) }
  | LBRACE record_pat=separated_nonempty_list(SEMICOLON, separated_pair(qlident, EQUALS, tuplePattern)) RBRACE
      { mk_pattern (PatRecord record_pat) (rhs2 parseState 1 3) }
  | LENS_PAREN_LEFT pat0=constructorPattern COMMA pats=separated_nonempty_list(COMMA, constructorPattern) LENS_PAREN_RIGHT
      { mk_pattern (PatTuple(pat0::pats, true)) (rhs2 parseState 1 5) }
  | LPAREN pat=tuplePattern RPAREN   { pat }
  | tv=tvar                   { mk_pattern (PatTvar (tv, None)) (rhs parseState 1) }
  | LPAREN op=operator RPAREN
      { mk_pattern (PatOp op) (rhs2 parseState 1 3) }
  | UNDERSCORE
      { mk_pattern PatWild (rhs parseState 1) }
  | c=constant
      { mk_pattern (PatConst c) (rhs parseState 1) }
  | qual_id=aqualified(lident)
      { mk_pattern (PatVar (snd qual_id, fst qual_id)) (rhs parseState 1) }
  | uid=quident
      { mk_pattern (PatName uid) (rhs parseState 1) }

  (* (x : t) is already covered by atomicPattern *)
  (* we do NOT allow _ in multibinder () since it creates reduce/reduce conflicts when  *)
  (* preprocessing to ocamlyacc/fsyacc (which is expected since the macro are expanded) *)
patternOrMultibinder:
  | pat=atomicPattern { [pat] }
  | LPAREN qual_id0=aqualified(lident) qual_ids=nonempty_list(aqualified(lident)) COLON t=typ r=refineOpt RPAREN
      {
        let pos = rhs2 parseState 1 7 in
        let t_pos = rhs parseState 5 in
        let qual_ids = qual_id0 :: qual_ids in
        List.map (fun (q, x) -> mkRefinedPattern (mk_pattern (PatVar (x, q)) pos) t false r t_pos pos) qual_ids
      }

binder:
  | aqualified_lid=aqualified(lidentOrUnderscore)
     {
       let (q, lid) = aqualified_lid in
       mk_binder (Variable lid) (rhs parseState 1) Type q
     }
  | tv=tvar  { mk_binder (TVariable tv) (rhs parseState 1) Kind None  }
       (* small regression here : fun (=x : t) ... is not accepted anymore *)

multiBinder:
  | LPAREN qual_ids=nonempty_list(aqualified(lidentOrUnderscore)) COLON t=typ r=refineOpt RPAREN
     {
       let should_bind_var = match qual_ids with | [ _ ] -> true | _ -> false in
       List.map (fun (q, x) -> mkRefinedBinder x t should_bind_var r (rhs2 parseState 1 6) q) qual_ids
     }

binders: bss=list(b=binder {[b]} | bs=multiBinder {bs}) { flatten bss }

aqualified(X): x=pair(ioption(aqualUniverses), X) { x }

/******************************************************************************/
/*                      Identifiers, module paths                             */
/******************************************************************************/

qlident:
  | ids=path(lident) { lid_of_ids ids }

quident:
  | ids=path(uident) { lid_of_ids ids }

path(Id):
  | id=Id { [id] }
  | uid=uident DOT p=path(Id) { uid::p }

ident:
  | x=lident { x }
  | x=uident  { x }

lidentOrOperator:
  | id=IDENT
    { mk_ident(id, rhs parseState 1) }
  | LPAREN id=operator RPAREN
    { mk_ident(compile_op (-1) id, rhs parseState 2) }

lidentOrUnderscore:
  | id=IDENT { mk_ident(id, rhs parseState 1)}
  | UNDERSCORE { gen (rhs parseState 1) }

lident:
  | id=IDENT { mk_ident(id, rhs parseState 1)}

uident:
  | id=NAME { mk_ident(id, rhs parseState 1) }

tvar:
  | tv=TVAR { mk_ident(tv, rhs parseState 1) }


/******************************************************************************/
/*                            Types and terms                                 */
/******************************************************************************/

ascribeTyp:
  | COLON t=tmArrow(tmNoEq) { t }

(* Remove for stratify *)
ascribeKind:
  | COLON  k=kind { k }

(* Remove for stratify *)
kind:
  | t=tmArrow(tmNoEq) { {t with level=Kind} }






term:
  | e=noSeqTerm
      { e }
  | e1=noSeqTerm SEMICOLON e2=term
      { mk_term (Seq(e1, e2)) (rhs2 parseState 1 3) Expr }


noSeqTerm:
  | t=typ  { t }
  | e=tmIff SUBTYPE t=typ
      { mk_term (Ascribed(e,{t with level=Expr})) (rhs2 parseState 1 3) Expr }
  | e1=atomicTermNotQUident op_expr=dotOperator LARROW e3=noSeqTerm
      {
        let (op, e2, _) = op_expr in
        mk_term (Op(op ^ "<-", [ e1; e2; e3 ])) (rhs2 parseState 1 4) Expr
      }
  | REQUIRES t=typ
      { mk_term (Requires(t, None)) (rhs2 parseState 1 2) Type }
  | ENSURES t=typ
      { mk_term (Ensures(t, None)) (rhs2 parseState 1 2) Type }
  | ATTRIBUTES es=nonempty_list(atomicTerm)
      { mk_term (Attributes es) (rhs2 parseState 1 2) Type }
  | IF e1=noSeqTerm THEN e2=noSeqTerm ELSE e3=noSeqTerm
      { mk_term (If(e1, e2, e3)) (rhs2 parseState 1 6) Expr }
  | IF e1=noSeqTerm THEN e2=noSeqTerm
      {
        let e3 = mk_term (Const Const_unit) (rhs2 parseState 4 4) Expr in
        mk_term (If(e1, e2, e3)) (rhs2 parseState 1 4) Expr
      }
  | TRY e1=term WITH pbs=left_flexible_nonempty_list(BAR, patternBranch)
      {
         let branches = focusBranches (pbs) (rhs2 parseState 1 4) in
         mk_term (TryWith(e1, branches)) (rhs2 parseState 1 4) Expr
      }
  | MATCH e=term WITH pbs=list(BAR pb=patternBranch {pb})
      {
        let branches = focusBranches pbs (rhs2 parseState 1 4) in
        mk_term (Match(e, branches)) (rhs2 parseState 1 4) Expr
      }
  | LET OPEN uid=quident IN e=term
      { mk_term (LetOpen(uid, e)) (rhs2 parseState 1 5) Expr }
  | LET q=letqualifier lbs=separated_nonempty_list(AND,letbinding) IN e=term
      {
        let lbs = focusLetBindings lbs (rhs2 parseState 2 3) in
        mk_term (Let(q, lbs, e)) (rhs2 parseState 1 5) Expr
      }
  | FUNCTION pbs=left_flexible_nonempty_list(BAR, patternBranch)
      {
        let branches = focusBranches pbs (rhs2 parseState 1 2) in
        mk_function branches (lhs parseState) (rhs2 parseState 1 2)
      }
  | ASSUME e=atomicTerm
      { mkExplicitApp (mk_term (Var assume_lid) (rhs parseState 1) Expr) [e] (rhs2 parseState 1 2) }
  | id=lident LARROW e=noSeqTerm
      { mk_term (Assign(id, e)) (rhs2 parseState 1 3) Expr }

typ:
  | t=simpleTerm  { t }

  | q=quantifier bs=binders DOT trigger=trigger e=noSeqTerm
      {
        match bs with
            | [] -> raise (Error("Missing binders for a quantifier", rhs2 parseState 1 3))
            | _ -> mk_term (q (bs, trigger, e)) (rhs2 parseState 1 5) Formula
      }

%inline quantifier:
  | FORALL { fun x -> QForall x }
  | EXISTS { fun x -> QExists x}

trigger:
  |   { [] }
  | LBRACE_COLON_PATTERN pats=disjunctivePats RBRACE { pats }

disjunctivePats:
  | pats=separated_nonempty_list(DISJUNCTION, conjunctivePat) { pats }

conjunctivePat:
  | pats=separated_nonempty_list(SEMICOLON, appTerm)          { pats }

simpleTerm:
  | e=tmIff { e }
  | FUN pats=nonempty_list(patternOrMultibinder) RARROW e=term
      { mk_term (Abs(flatten pats, e)) (rhs2 parseState 1 4) Un }

maybeFocusArrow:
  | RARROW          { false }
  | SQUIGGLY_RARROW { true }

patternBranch:
  | pat=disjunctivePattern when_opt=maybeWhen focus=maybeFocusArrow e=term
      {
        let pat = match pat with
          | [p] -> p
          | ps -> mk_pattern (PatOr ps) (rhs2 parseState 1 1)
        in
        (focus, (pat, when_opt, e))
      }

%inline maybeWhen:
  |                      { None }
  | WHEN e=tmFormula     { Some e }



tmIff:
  | e1=tmImplies IFF e2=tmIff
      { mk_term (Op("<==>", [e1; e2])) (rhs2 parseState 1 3) Formula }
  | e=tmImplies { e }

tmImplies:
  | e1=tmArrow(tmFormula) IMPLIES e2=tmImplies
      { mk_term (Op("==>", [e1; e2])) (rhs2 parseState 1 3) Formula }
  | e=tmArrow(tmFormula)
      { e }


(* Tm : tmDisjunction (now tmFormula, containing EQUALS) or tmCons (now tmNoEq, without EQUALS) *)
tmArrow(Tm):
  | dom=tmArrowDomain(Tm) RARROW tgt=tmArrow(Tm)
     {
       let (aq_opt, dom_tm) = dom in
       let b = match extract_named_refinement dom_tm with
         | None -> mk_binder (NoName dom_tm) (rhs parseState 1) Un aq_opt
         | Some (x, t, f) -> mkRefinedBinder x t true f (rhs2 parseState 1 1) aq_opt
       in
       mk_term (Product([b], tgt)) (rhs2 parseState 1 3)  Un
     }
  | e=Tm { e }

(* Tm already account for ( term ), we need to add an explicit case for (#Tm) *)
%inline tmArrowDomain(Tm):
  | LPAREN q=aqual dom_tm=Tm RPAREN { Some q, dom_tm }
  | aq_opt=ioption(aqual) dom_tm=Tm { aq_opt, dom_tm }

tmFormula:
  | e1=tmFormula DISJUNCTION e2=tmConjunction
      { mk_term (Op("\\/", [e1;e2])) (rhs2 parseState 1 3) Formula }
  | e=tmConjunction { e }

tmConjunction:
  | e1=tmConjunction CONJUNCTION e2=tmTuple
      { mk_term (Op("/\\", [e1;e2])) (rhs2 parseState 1 3) Formula }
  | e=tmTuple { e }

tmTuple:
  | el=separated_nonempty_list(COMMA, tmEq)
      {
        match el with
          | [x] -> x
          | components -> mkTuple components (rhs2 parseState 1 1)
      }


tmEq:
  | e1=tmEq BACKTICK id=qlident BACKTICK e2=tmEq
      { mkApp (mk_term (Var id) (rhs2 parseState 2 4) Un) [ e1, Nothing; e2, Nothing ] (rhs2 parseState 1 5) }
  | e1=tmEq EQUALS e2=tmEq
      { mk_term (Op("=", [e1; e2])) (rhs2 parseState 1 3) Un}
  (* non-associativity of COLON_EQUALS is currently not well handled by fsyacc which reports a s/r conflict *)
  (* see https:/ /github.com/fsprojects/FsLexYacc/issues/39 *)
  | e1=tmEq COLON_EQUALS e2=tmEq
      { mk_term (Op(":=", [e1; e2])) (rhs2 parseState 1 3) Un}
  | e1=tmEq PIPE_RIGHT e2=tmEq
      { mk_term (Op("|>", [e1; e2])) (rhs2 parseState 1 3) Un}
  | e1=tmEq op=operatorInfix0ad12 e2=tmEq
      { mk_term (Op(op, [e1; e2])) (rhs2 parseState 1 3) Un}
  | e=tmNoEq
      { e }

tmNoEq:
  | e1=tmNoEq COLON_COLON e2=tmNoEq
      { consTerm (rhs parseState 2) e1 e2 }
  | e1=tmNoEq AMP e2=tmNoEq
      {
        let x, t, f = match extract_named_refinement e1 with
            | Some (x, t, f) -> x, t, f
            | _ -> raise (Error("Missing binder for the first component of a dependent tuple", rhs parseState 1)) in
        let dom = mkRefinedBinder x t true f (rhs parseState 1) None in
        let tail = e2 in
        let dom, res = match tail.tm with
            | Sum(dom', res) -> dom::dom', res
            | _ -> [dom], tail in
        mk_term (Sum(dom, res)) (rhs2 parseState 1 3) Type
      }
  | e1=tmNoEq MINUS e2=tmNoEq
      { mk_term (Op("-", [e1; e2])) (rhs2 parseState 1 3) Un}
  | e1=tmNoEq op=OPINFIX3 e2=tmNoEq
      { mk_term (Op(op, [e1; e2])) (rhs2 parseState 1 3) Un}
  | e1=tmNoEq op=OPINFIX4 e2=tmNoEq
      { mk_term (Op(op, [e1; e2])) (rhs2 parseState 1 3) Un}
  | MINUS e=tmNoEq
      { mk_uminus e (rhs2 parseState 1 2) Expr }
  | id=lidentOrUnderscore COLON e=appTerm phi_opt=refineOpt
      {
        let t = match phi_opt with
          | None -> NamedTyp(id, e)
          | Some phi -> Refine(mk_binder (Annotated(id, e)) (rhs2 parseState 1 3) Type None, phi)
        in mk_term t (rhs2 parseState 1 4) Type
      }
  | LBRACE e=recordExp RBRACE { e }
  | op=TILDE e=atomicTerm
      { mk_term (Op(op, [e])) (rhs2 parseState 1 2) Formula }
  | e=appTerm { e }

refineOpt:
  | phi_opt=option(LBRACE phi=formula RBRACE {phi}) {phi_opt}

%inline formula:
  | e=noSeqTerm { {e with level=Formula} }

recordExp:
  | record_fields=right_flexible_nonempty_list(SEMICOLON, simpleDef)
      { mk_term (Record (None, record_fields)) (rhs parseState 1) Expr }
  | e=appTerm WITH  record_fields=right_flexible_nonempty_list(SEMICOLON, simpleDef)
      { mk_term (Record (Some e, record_fields)) (rhs2 parseState 1 3) Expr }

simpleDef:
  | e=separated_pair(qlident, EQUALS, simpleTerm) { e }

appTerm:
  | head=indexingTerm args=list(argTerm)
      { mkApp head (map (fun (x,y) -> (y,x)) args) (rhs2 parseState 1 2) }

argTerm:
  | x=pair(maybeHash, indexingTerm) { x }
  | u=universe { u }
  | u=univar { UnivApp, u }

%inline maybeHash:
  |      { Nothing }
  | HASH { Hash }

indexingTerm:
  | e1=atomicTermNotQUident op_exprs=nonempty_list(dotOperator)
      {
        List.fold_left (fun e1 (op, e2, r) ->
            mk_term (Op(op, [ e1; e2 ])) (union_ranges e1.range r) Expr)
            e1 op_exprs
      }
  | e=atomicTerm
    { e }

atomicTerm:
  | x=atomicTermNotQUident
    { x }
  | x=atomicTermQUident
    { x }
  | x=opPrefixTerm(atomicTermQUident)
    { x }

atomicTermQUident:
  | id=quident
    {
        let t = Name id in
        let e = mk_term t (rhs parseState 1) Un in
	      e
    }
  | id=quident DOT_LPAREN t=term RPAREN
    {
      mk_term (LetOpen (id, t)) (rhs2 parseState 1 4) Expr
    }

atomicTermNotQUident:
  | UNDERSCORE { mk_term Wild (rhs parseState 1) Un }
  | ASSERT   { mk_term (Var assert_lid) (rhs parseState 1) Expr }
  | tv=tvar     { mk_term (Tvar tv) (rhs parseState 1) Type }
  | c=constant { mk_term (Const c) (rhs parseState 1) Expr }
  | L_TRUE   { mk_term (Name (lid_of_path ["True"] (rhs parseState 1))) (rhs parseState 1) Type }
  | L_FALSE   { mk_term (Name (lid_of_path ["False"] (rhs parseState 1))) (rhs parseState 1) Type }
  | x=opPrefixTerm(atomicTermNotQUident)
    { x }
  | LPAREN op=operator RPAREN
      { mk_term (Op(op, [])) (rhs2 parseState 1 3) Un }
  | LENS_PAREN_LEFT e0=tmEq COMMA el=separated_nonempty_list(COMMA, tmEq) LENS_PAREN_RIGHT
      { mkDTuple (e0::el) (rhs2 parseState 1 5) }
  | e=projectionLHS field_projs=list(DOT id=qlident {id})
      { fold_left (fun e lid -> mk_term (Project(e, lid)) (rhs2 parseState 1 2) Expr ) e field_projs }
  | BEGIN e=term END
      { e }

(* Tm: atomicTermQUident or atomicTermNotQUident *)
opPrefixTerm(Tm):
  | op=OPPREFIX e=Tm
      { mk_term (Op(op, [e])) (rhs2 parseState 1 2) Expr }


projectionLHS:
  | e=qidentWithTypeArgs(qlident, option(fsTypeArgs))
      { e }
  | e=qidentWithTypeArgs(quident, some(fsTypeArgs))
      { e }
  | LPAREN e=term sort_opt=option(pair(hasSort, simpleTerm)) RPAREN
      {
        let e1 = match sort_opt with
          | None -> e
          | Some (level, t) -> mk_term (Ascribed(e,{t with level=level})) (rhs2 parseState 1 4) level
        in mk_term (Paren e1) (rhs2 parseState 1 4) (e.level)
      }
  | LBRACK_BAR es=semiColonTermList BAR_RBRACK
      {
        let l = mkConsList (rhs2 parseState 1 3) es in
        let pos = (rhs2 parseState 1 3) in
        mkExplicitApp (mk_term (Var (array_mk_array_lid)) pos Expr) [l] pos
      }
  | LBRACK es=semiColonTermList RBRACK
      { mkConsList (rhs2 parseState 1 3) es }
  | PERCENT_LBRACK es=semiColonTermList RBRACK
      { mkLexList (rhs2 parseState 1 3) es }
  | BANG_LBRACE es=separated_list(COMMA, appTerm) RBRACE
      { mkRefSet (rhs2 parseState 1 3) es }
  | ns=quident QMARK_DOT id=lident
      { mk_term (Projector (ns, id)) (rhs2 parseState 1 3) Expr }
  | lid=quident QMARK
      { mk_term (Discrim lid) (rhs2 parseState 1 2) Un }

fsTypeArgs:
  | TYP_APP_LESS targs=separated_nonempty_list(COMMA, atomicTerm) TYP_APP_GREATER
    {targs}

(* Qid : quident or qlident.
   TypeArgs : option(fsTypeArgs) or someFsTypeArgs. *)
qidentWithTypeArgs(Qid,TypeArgs):
  | id=Qid targs_opt=TypeArgs
      {
        let t = if is_name id then Name id else Var id in
        let e = mk_term t (rhs parseState 1) Un in
        match targs_opt with
        | None -> e
        | Some targs -> mkFsTypApp e targs (rhs2 parseState 1 2)
      }

hasSort:
  (* | SUBTYPE { Expr } *)
  | SUBKIND { Type } (* Remove with stratify *)

  (* use flexible_list *)
%inline semiColonTermList:
  | l=right_flexible_list(SEMICOLON, noSeqTerm) { l }


constant:
  | LPAREN_RPAREN { Const_unit }
  | n=INT
     {
        if snd n then
          errorR(Error("This number is outside the allowable range for representable integer constants", lhs(parseState)));
        Const_int (fst n, None)
     }
  | c=CHAR { Const_char c }
  | s=STRING { Const_string (s,lhs(parseState)) }
  | bs=BYTEARRAY { Const_bytearray (bs,lhs(parseState)) }
  | TRUE { Const_bool true }
  | FALSE { Const_bool false }
  | f=IEEE64 { Const_float f }
  | n=UINT8 { Const_int (n, Some (Unsigned, Int8)) }
  | n=INT8
      {
        if snd n then
          errorR(Error("This number is outside the allowable range for 8-bit signed integers", lhs(parseState)));
        Const_int (fst n, Some (Signed, Int8))
      }
  | n=UINT16 { Const_int (n, Some (Unsigned, Int16)) }
  | n=INT16
      {
        if snd n then
          errorR(Error("This number is outside the allowable range for 16-bit signed integers", lhs(parseState)));
        Const_int (fst n, Some (Signed, Int16))
      }
  | n=UINT32 { Const_int (n, Some (Unsigned, Int32)) }
  | n=INT32
      {
        if snd n then
          errorR(Error("This number is outside the allowable range for 32-bit signed integers", lhs(parseState)));
        Const_int (fst n, Some (Signed, Int32))
      }
  | n=UINT64 { Const_int (n, Some (Unsigned, Int64)) }
  | n=INT64
      {
        if snd n then
          errorR(Error("This number is outside the allowable range for 64-bit signed integers", lhs(parseState)));
        Const_int (fst n, Some (Signed, Int64))
      }
  (* TODO : What about reflect ? There is also a constant representing it *)
  | REIFY   { Const_reify }


universe:
  | UNIV_HASH ua=atomicUniverse { (UnivApp, ua) }

universeFrom:
  | ua=atomicUniverse { ua }
  | u1=universeFrom op_plus=OPINFIX2 u2=universeFrom
       {
         if op_plus <> "+"
         then errorR(Error("The operator " ^ op_plus ^ " was found in universe context."
                           ^ "The only allowed operator in that context is +.",
                           rhs parseState 2)) ;
         mk_term (Op(op_plus, [u1 ; u2])) (rhs2 parseState 1 3) Expr
       }
  | max=ident us=list(atomicUniverse)
      {
        if text_of_id max <> text_of_lid max_lid
        then errorR(Error("A lower case ident " ^ text_of_id max ^
                          " was found in a universe context. " ^
                          "It should be either max or a universe variable 'usomething.",
                          rhs parseState 1)) ;
        let max = mk_term (Var (lid_of_ids [max])) (rhs parseState 1) Expr in
        mkApp max (map (fun u -> u, Nothing) us) (rhs2 parseState 1 2)
      }

atomicUniverse:
  | UNDERSCORE
      { mk_term Wild (rhs parseState 1) Expr }
  | n=INT
      {
        if snd n then
          errorR(Error("This number is outside the allowable range for representable integer constants",
                       lhs(parseState)));
        mk_term (Const (Const_int (fst n, None))) (rhs parseState 1) Expr
      }
  | u=univar { u }
  | LPAREN u=universeFrom RPAREN
      { mk_term (Paren u) (rhs2 parseState 1 3) Expr }

univar:
  | id=UNIVAR
      {
        let pos = rhs parseState 1 in
        mk_term (Uvar (mk_ident (id, pos))) pos Expr
      }

/******************************************************************************/
/*                       Miscellanous, tools                                   */
/******************************************************************************/

%inline string:
  | s=STRING { string_of_bytes s }

%inline operator:
  | op=OPPREFIX
  | op=OPINFIX3
  | op=OPINFIX4
  | op=operatorInfix0ad12
     { op }

/* These infix operators have a lower precedence than EQUALS */
%inline operatorInfix0ad12:
  | op=OPINFIX0a
  | op=OPINFIX0b
  | op=OPINFIX0c
  | op=OPINFIX0d
  | op=OPINFIX1
  | op=OPINFIX2
     { op }

%inline dotOperator:
  | DOT_LPAREN e=term RPAREN { ".()", e, rhs2 parseState 1 3 }
  | DOT_LBRACK e=term RBRACK { ".[]", e, rhs2 parseState 1 3 }

some(X):
  | x=X { Some x }

right_flexible_list(SEP, X):
  |     { [] }
  | x=X { [x] }
  | x=X SEP xs=right_flexible_list(SEP, X) { x :: xs }

right_flexible_nonempty_list(SEP, X):
  | x=X { [x] }
  | x=X SEP xs=right_flexible_list(SEP, X) { x :: xs }

reverse_left_flexible_list(delim, X):
| (* nothing *)
   { [] }
| x = X
   { [x] }
| xs = reverse_left_flexible_list(delim, X) delim x = X
   { x :: xs }

%inline left_flexible_list(delim, X):
 xs = reverse_left_flexible_list(delim, X)
   { List.rev xs }

reverse_left_flexible_nonempty_list(delim, X):
| ioption(delim) x = X
   { [x] }
| xs = reverse_left_flexible_nonempty_list(delim, X) delim x = X
   { x :: xs }

%inline left_flexible_nonempty_list(delim, X):
 xs = reverse_left_flexible_nonempty_list(delim, X)
   { List.rev xs }
