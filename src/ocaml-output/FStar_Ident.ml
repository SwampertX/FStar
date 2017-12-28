
open Prims
open FStar_Pervasives
type ident =
{idText : Prims.string; idRange : FStar_Range.range}


let __proj__Mkident__item__idText : ident  ->  Prims.string = (fun projectee -> (match (projectee) with
| {idText = __fname__idText; idRange = __fname__idRange} -> begin
__fname__idText
end))


let __proj__Mkident__item__idRange : ident  ->  FStar_Range.range = (fun projectee -> (match (projectee) with
| {idText = __fname__idText; idRange = __fname__idRange} -> begin
__fname__idRange
end))


type path =
Prims.string Prims.list

type lident =
  {
  ns: ident Prims.list;
  ident: ident;
  nsstr: Prims.string;
  str: Prims.string;}[@@deriving show]
let __proj__Mklident__item__ns: lident -> ident Prims.list =
  fun projectee  ->
    match projectee with
    | { ns = __fname__ns; ident = __fname__ident; nsstr = __fname__nsstr;
        str = __fname__str;_} -> __fname__ns
let __proj__Mklident__item__ident: lident -> ident =
  fun projectee  ->
    match projectee with
    | { ns = __fname__ns; ident = __fname__ident; nsstr = __fname__nsstr;
        str = __fname__str;_} -> __fname__ident
let __proj__Mklident__item__nsstr: lident -> Prims.string =
  fun projectee  ->
    match projectee with
    | { ns = __fname__ns; ident = __fname__ident; nsstr = __fname__nsstr;
        str = __fname__str;_} -> __fname__nsstr
let __proj__Mklident__item__str: lident -> Prims.string =
  fun projectee  ->
    match projectee with
    | { ns = __fname__ns; ident = __fname__ident; nsstr = __fname__nsstr;
        str = __fname__str;_} -> __fname__str
type lid = lident[@@deriving show]
let mk_ident:
  (Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple2 -> ident =
  fun uu____85  ->
    match uu____85 with | (text,range) -> { idText = text; idRange = range }
let reserved_prefix: Prims.string = "uu___"
let gen: FStar_Range.range -> ident =
  let x = FStar_Util.mk_ref (Prims.parse_int "0") in
  fun r  ->
    (let uu____99 =
       let uu____100 = FStar_ST.op_Bang x in
       uu____100 + (Prims.parse_int "1") in
     FStar_ST.op_Colon_Equals x uu____99);
    (let uu____241 =
       let uu____246 =
         let uu____247 =
           let uu____248 = FStar_ST.op_Bang x in
           Prims.string_of_int uu____248 in
         Prims.strcat reserved_prefix uu____247 in
       (uu____246, r) in
     mk_ident uu____241)
let id_of_text: Prims.string -> ident =
  fun str  -> mk_ident (str, FStar_Range.dummyRange)
let text_of_id: ident -> Prims.string = fun id1  -> id1.idText
let text_of_path: Prims.string Prims.list -> Prims.string =
  fun path  -> FStar_Util.concat_l "." path
let path_of_text: Prims.string -> Prims.string Prims.list =
  fun text  -> FStar_String.split [46] text
let path_of_ns: ident Prims.list -> Prims.string Prims.list =
  fun ns  -> FStar_List.map text_of_id ns
let path_of_lid: lident -> Prims.string Prims.list =
  fun lid  ->
    FStar_List.map text_of_id (FStar_List.append lid.ns [lid.ident])
let ids_of_lid: lident -> ident Prims.list =
  fun lid  -> FStar_List.append lid.ns [lid.ident]
let lid_of_ns_and_id: ident Prims.list -> ident -> lident =
  fun ns  ->
    fun id1  ->
      let nsstr =
        let uu____370 = FStar_List.map text_of_id ns in
        FStar_All.pipe_right uu____370 text_of_path in
      {
        ns;
        ident = id1;
        nsstr;
        str =
          (if nsstr = ""
           then id1.idText
           else Prims.strcat nsstr (Prims.strcat "." id1.idText))
      }
let lid_of_ids: ident Prims.list -> lident =
  fun ids  ->
    let uu____383 = FStar_Util.prefix ids in
    match uu____383 with | (ns,id1) -> lid_of_ns_and_id ns id1
let lid_of_str: Prims.string -> lident =
  fun str  ->
    let uu____399 = FStar_List.map id_of_text (FStar_Util.split str ".") in
    lid_of_ids uu____399
let lid_of_path: Prims.string Prims.list -> FStar_Range.range -> lident =
  fun path  ->
    fun pos  ->
      let ids = FStar_List.map (fun s  -> mk_ident (s, pos)) path in
      lid_of_ids ids
let text_of_lid: lident -> Prims.string = fun lid  -> lid.str
let lid_equals: lident -> lident -> Prims.bool =
  fun l1  -> fun l2  -> l1.str = l2.str
let ident_equals: ident -> ident -> Prims.bool =
  fun id1  -> fun id2  -> id1.idText = id2.idText
let range_of_lid: lid -> FStar_Range.range = fun lid  -> (lid.ident).idRange
let set_lid_range: lident -> FStar_Range.range -> lident =
  fun l  ->
    fun r  ->
      let uu___22_441 = l in
      {
        ns = (uu___22_441.ns);
        ident =
          (let uu___23_443 = l.ident in
           { idText = (uu___23_443.idText); idRange = r });
        nsstr = (uu___22_441.nsstr);
        str = (uu___22_441.str)
      }
let lid_add_suffix: lident -> Prims.string -> lident =
  fun l  ->
    fun s  ->
      let path = path_of_lid l in
      lid_of_path (FStar_List.append path [s]) (range_of_lid l)
let ml_path_of_lid: lident -> Prims.string =
  fun lid  ->
    let uu____456 =
      let uu____459 = path_of_ns lid.ns in
      FStar_List.append uu____459 [text_of_id lid.ident] in
    FStar_All.pipe_left (FStar_String.concat "_") uu____456
let string_of_lid: lident -> Prims.string =
  fun lid  -> let uu____467 = path_of_lid lid in text_of_path uu____467