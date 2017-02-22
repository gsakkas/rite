  type loc = Loc.t
   and meta_bool =
    [ BTrue
    | BFalse
    | BAnt of string ]
   and meta_option 'a =
    [ ONone
    | OSome of 'a
    | OAnt of string ]
   and meta_list 'a =
    [ LNil
    | LCons of 'a and meta_list 'a
    | LAnt of string ]
   and ident =
    [ IdAcc of loc and ident and ident (* i . i *)
    | IdApp of loc and ident and ident (* i i *)
    | IdLid of loc and string (* foo *)
    | IdUid of loc and string (* Bar *)
    | IdAnt of loc and string (* $s$ *) ]
   and ctyp =
    [ TyNil of loc
    | TyAli of loc and ctyp and ctyp (* t as t *) (* list 'a as 'a *)
    | TyAny of loc (* _ *)
    | TyApp of loc and ctyp and ctyp (* t t *) (* list 'a *)
    | TyArr of loc and ctyp and ctyp (* t -> t *) (* int -> string *)
    | TyCls of loc and ident (* #i *) (* #point *)
    | TyLab of loc and string and ctyp (* ~s:t *)
    | TyId  of loc and ident (* i *) (* Lazy.t *)
    | TyMan of loc and ctyp and ctyp (* t == t *) (* type t = [ A | B ] == Foo.t *)
      (* type t 'a 'b 'c = t constraint t = t constraint t = t *)
    | TyDcl of loc and string and list ctyp and ctyp and list (ctyp * ctyp)
      (* < (t)? (..)? > *) (* < move : int -> 'a .. > as 'a  *)
    | TyObj of loc and ctyp and meta_bool
    | TyOlb of loc and string and ctyp (* ?s:t *)
    | TyPol of loc and ctyp and ctyp (* ! t . t *) (* ! 'a . list 'a -> 'a *)
    | TyQuo of loc and string (* 's *)
    | TyQuP of loc and string (* +'s *)
    | TyQuM of loc and string (* -'s *)
    | TyVrn of loc and string (* `s *)
    | TyRec of loc and ctyp (* { t } *) (* { foo : int ; bar : mutable string } *)
    | TyCol of loc and ctyp and ctyp (* t : t *)
    | TySem of loc and ctyp and ctyp (* t; t *)
    | TyCom of loc and ctyp and ctyp (* t, t *)
    | TySum of loc and ctyp (* [ t ] *) (* [ A of int and string | B ] *)
    | TyOf  of loc and ctyp and ctyp (* t of t *) (* A of int *)
    | TyAnd of loc and ctyp and ctyp (* t and t *)
    | TyOr  of loc and ctyp and ctyp (* t | t *)
    | TyPrv of loc and ctyp (* private t *)
    | TyMut of loc and ctyp (* mutable t *)
    | TyTup of loc and ctyp (* ( t ) *) (* (int * string) *)
    | TySta of loc and ctyp and ctyp (* t * t *)
    | TyVrnEq of loc and ctyp (* [ = t ] *)
    | TyVrnSup of loc and ctyp (* [ > t ] *)
    | TyVrnInf of loc and ctyp (* [ < t ] *)
    | TyVrnInfSup of loc and ctyp and ctyp (* [ < t > t ] *)
    | TyAmp of loc and ctyp and ctyp (* t & t *)
    | TyOfAmp of loc and ctyp and ctyp (* t of & t *)
    | TyAnt of loc and string (* $s$ *)
    ]
   and patt =
    [ PaNil of loc
    | PaId  of loc and ident (* i *)
    | PaAli of loc and patt and patt (* p as p *) (* (Node x y as n) *)
    | PaAnt of loc and string (* $s$ *)
    | PaAny of loc (* _ *)
    | PaApp of loc and patt and patt (* p p *) (* fun x y -> *)
    | PaArr of loc and patt (* [| p |] *)
    | PaCom of loc and patt and patt (* p, p *)
    | PaSem of loc and patt and patt (* p; p *)
    | PaChr of loc and string (* c *) (* 'x' *)
    | PaInt of loc and string
    | PaInt32 of loc and string
    | PaInt64 of loc and string
    | PaNativeInt of loc and string
    | PaFlo of loc and string
    | PaLab of loc and string and patt (* ~s or ~s:(p) *)
    (* ?s or ?s:(p) *)
    | PaOlb of loc and string and patt
    (* ?s:(p = e) or ?(p = e) *)
    | PaOlbi of loc and string and patt and expr
    | PaOrp of loc and patt and patt (* p | p *)
    | PaRng of loc and patt and patt (* p .. p *)
    | PaRec of loc and patt (* { p } *)
    | PaEq  of loc and ident and patt (* i = p *)
    | PaStr of loc and string (* s *)
    | PaTup of loc and patt (* ( p ) *)
    | PaTyc of loc and patt and ctyp (* (p : t) *)
    | PaTyp of loc and ident (* #i *)
    | PaVrn of loc and string (* `s *) ]
  and expr =
    [ ExNil of loc
    | ExId  of loc and ident (* i *)
    | ExAcc of loc and expr and expr (* e.e *)
    | ExAnt of loc and string (* $s$ *)
    | ExApp of loc and expr and expr (* e e *)
    | ExAre of loc and expr and expr (* e.(e) *)
    | ExArr of loc and expr (* [| e |] *)
    | ExSem of loc and expr and expr (* e; e *)
    | ExAsf of loc (* assert False *)
    | ExAsr of loc and expr (* assert e *)
    | ExAss of loc and expr and expr (* e := e *)
    | ExChr of loc and string (* 'c' *)
    | ExCoe of loc and expr and ctyp and ctyp (* (e : t) or (e : t :> t) *)
    | ExFlo of loc and string (* 3.14 *)
      (* for s = e to/downto e do { e } *)
    | ExFor of loc and string and expr and expr and meta_bool and expr
    | ExFun of loc and match_case (* fun [ mc ] *)
    | ExIfe of loc and expr and expr and expr (* if e then e else e *)
    | ExInt of loc and string (* 42 *)
    | ExInt32 of loc and string
    | ExInt64 of loc and string
    | ExNativeInt of loc and string
    | ExLab of loc and string and expr (* ~s or ~s:e *)
    | ExLaz of loc and expr (* lazy e *)
      (* let b in e or let rec b in e *)
    | ExLet of loc and meta_bool and binding and expr
      (* let module s = me in e *)
    | ExLmd of loc and string and module_expr and expr
      (* match e with [ mc ] *)
    | ExMat of loc and expr and match_case
      (* new i *)
    | ExNew of loc and ident
      (* object ((p))? (cst)? end *)
    | ExObj of loc and patt and class_str_item
      (* ?s or ?s:e *)
    | ExOlb of loc and string and expr
      (* {< rb >} *)
    | ExOvr of loc and rec_binding
      (* { rb } or { (e) with rb } *)
    | ExRec of loc and rec_binding and expr
      (* do { e } *)
    | ExSeq of loc and expr
      (* e#s *)
    | ExSnd of loc and expr and string
      (* e.[e] *)
    | ExSte of loc and expr and expr
      (* s *) (* "foo" *)
    | ExStr of loc and string
      (* try e with [ mc ] *)
    | ExTry of loc and expr and match_case
      (* (e) *)
    | ExTup of loc and expr
      (* e, e *)
    | ExCom of loc and expr and expr
      (* (e : t) *)
    | ExTyc of loc and expr and ctyp
      (* `s *)
    | ExVrn of loc and string
      (* while e do { e } *)
    | ExWhi of loc and expr and expr ]
  and module_type =
    [ MtNil of loc
      (* i *) (* A.B.C *)
    | MtId  of loc and ident
      (* functor (s : mt) -> mt *)
    | MtFun of loc and string and module_type and module_type
      (* 's *)
    | MtQuo of loc and string
      (* sig sg end *)
    | MtSig of loc and sig_item
      (* mt with wc *)
    | MtWit of loc and module_type and with_constr 
    | MtAnt of loc and string (* $s$ *) ]
  and sig_item =
    [ SgNil of loc
      (* class cict *)
    | SgCls of loc and class_type
      (* class type cict *)
    | SgClt of loc and class_type
      (* sg ; sg *)
    | SgSem of loc and sig_item and sig_item
      (* # s or # s e *)
    | SgDir of loc and string and expr
      (* exception t *)
    | SgExc of loc and ctyp
      (* external s : t = s ... s *)
    | SgExt of loc and string and ctyp and meta_list string
      (* include mt *)
    | SgInc of loc and module_type
      (* module s : mt *)
    | SgMod of loc and string and module_type
      (* module rec mb *)
    | SgRecMod of loc and module_binding
      (* module type s = mt *)
    | SgMty of loc and string and module_type
      (* open i *)
    | SgOpn of loc and ident
      (* type t *)
    | SgTyp of loc and ctyp
      (* value s : t *)
    | SgVal of loc and string and ctyp
    | SgAnt of loc and string (* $s$ *) ]
  and with_constr =
    [ WcNil of loc
      (* type t = t *)
    | WcTyp of loc and ctyp and ctyp
      (* module i = i *)
    | WcMod of loc and ident and ident
      (* wc and wc *)
    | WcAnd of loc and with_constr and with_constr
    | WcAnt of loc and string (* $s$ *) ]
  and binding =
    [ BiNil of loc
      (* bi and bi *) (* let a = 42 and c = 43 *)
    | BiAnd of loc and binding and binding
      (* p = e *) (* let patt = expr *)
    | BiEq  of loc and patt and expr
    | BiAnt of loc and string (* $s$ *) ]
  and rec_binding =
    [ RbNil of loc
      (* rb ; rb *)
    | RbSem of loc and rec_binding and rec_binding
      (* i = e *)
    | RbEq  of loc and ident and expr
    | RbAnt of loc and string (* $s$ *) ]
  and module_binding =
    [ MbNil of loc
      (* mb and mb *) (* module rec (s : mt) = me and (s : mt) = me *)
    | MbAnd of loc and module_binding and module_binding
      (* s : mt = me *)
    | MbColEq  of loc and string and module_type and module_expr
      (* s : mt *)
    | MbCol  of loc and string and module_type
    | MbAnt of loc and string (* $s$ *) ]
  and match_case =
    [ McNil of loc
      (* a | a *)
    | McOr of loc and match_case and match_case
      (* p (when e)? -> e *)
    | McArr of loc and patt and expr and expr
    | McAnt of loc and string (* $s$ *) ]
  and module_expr =
    [ MeNil of loc
      (* i *)
    | MeId  of loc and ident
      (* me me *)
    | MeApp of loc and module_expr and module_expr
      (* functor (s : mt) -> me *)
    | MeFun of loc and string and module_type and module_expr
      (* struct st end *)
    | MeStr of loc and str_item
      (* (me : mt) *)
    | MeTyc of loc and module_expr and module_type
    | MeAnt of loc and string (* $s$ *) ]
  and str_item =
    [ StNil of loc
      (* class cice *)
    | StCls of loc and class_expr
      (* class type cict *)
    | StClt of loc and class_type
      (* st ; st *)
    | StSem of loc and str_item and str_item
      (* # s or # s e *)
    | StDir of loc and string and expr
      (* exception t or exception t = i *)
    | StExc of loc and ctyp and meta_option(*FIXME*) ident
      (* e *)
    | StExp of loc and expr
      (* external s : t = s ... s *)
    | StExt of loc and string and ctyp and meta_list string
      (* include me *)
    | StInc of loc and module_expr
      (* module s = me *)
    | StMod of loc and string and module_expr
      (* module rec mb *)
    | StRecMod of loc and module_binding
      (* module type s = mt *)
    | StMty of loc and string and module_type
      (* open i *)
    | StOpn of loc and ident
      (* type t *)
    | StTyp of loc and ctyp
      (* value (rec)? bi *)
    | StVal of loc and meta_bool and binding
    | StAnt of loc and string (* $s$ *) ]
  and class_type =
    [ CtNil of loc
      (* (virtual)? i ([ t ])? *)
    | CtCon of loc and meta_bool and ident and ctyp
      (* [t] -> ct *)
    | CtFun of loc and ctyp and class_type
      (* object ((t))? (csg)? end *)
    | CtSig of loc and ctyp and class_sig_item
      (* ct and ct *)
    | CtAnd of loc and class_type and class_type
      (* ct : ct *)
    | CtCol of loc and class_type and class_type
      (* ct = ct *)
    | CtEq  of loc and class_type and class_type
      (* $s$ *)
    | CtAnt of loc and string ]
  and class_sig_item =
    [ CgNil of loc
      (* type t = t *)
    | CgCtr of loc and ctyp and ctyp
      (* csg ; csg *)
    | CgSem of loc and class_sig_item and class_sig_item
      (* inherit ct *)
    | CgInh of loc and class_type
      (* method s : t or method private s : t *)
    | CgMth of loc and string and meta_bool and ctyp
      (* value (virtual)? (mutable)? s : t *)
    | CgVal of loc and string and meta_bool and meta_bool and ctyp
      (* method virtual (mutable)? s : t *)
    | CgVir of loc and string and meta_bool and ctyp
    | CgAnt of loc and string (* $s$ *) ]
  and class_expr =
    [ CeNil of loc
      (* ce e *)
    | CeApp of loc and class_expr and expr
      (* (virtual)? i ([ t ])? *)
    | CeCon of loc and meta_bool and ident and ctyp
      (* fun p -> ce *)
    | CeFun of loc and patt and class_expr
      (* let (rec)? bi in ce *)
    | CeLet of loc and meta_bool and binding and class_expr
      (* object ((p))? (cst)? end *)
    | CeStr of loc and patt and class_str_item
      (* ce : ct *)
    | CeTyc of loc and class_expr and class_type
      (* ce and ce *)
    | CeAnd of loc and class_expr and class_expr
      (* ce = ce *)
    | CeEq  of loc and class_expr and class_expr
      (* $s$ *)
    | CeAnt of loc and string ]
  and class_str_item =
    [ CrNil of loc
      (* cst ; cst *)
    | CrSem of loc and class_str_item and class_str_item
      (* type t = t *)
    | CrCtr of loc and ctyp and ctyp
      (* inherit ce or inherit ce as s *)
    | CrInh of loc and class_expr and string
      (* initializer e *)
    | CrIni of loc and expr
      (* method (private)? s : t = e or method (private)? s = e *)
    | CrMth of loc and string and meta_bool and expr and ctyp
      (* value (mutable)? s = e *)
    | CrVal of loc and string and meta_bool and expr
      (* method virtual (private)? s : t *)
    | CrVir of loc and string and meta_bool and ctyp
      (* value virtual (private)? s : t *)
    | CrVvr of loc and string and meta_bool and ctyp
    | CrAnt of loc and string (* $s$ *) ];
