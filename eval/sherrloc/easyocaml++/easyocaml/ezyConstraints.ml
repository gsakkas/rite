open EzyOcamlmodules
open EzyUtils
open EzyUtils.Infix
open EzyTypingCoreTypes

(******************************************************************************)
(*                                 AtConstr                                   *
 * [AtConstr.t] is a constraint between two types annotated with a single     *
 * extended location.                                                         *)
(******************************************************************************)
module AtConstr = struct

  type t = {
    loc : ExtLocation.t ;
    tys : (Ty.t * Ty.t) ;
    exps : (string * string) ;
    leq : bool;
  }
  type printable = t
  type tyvar_container = t

  let create ?(leq = false) x exp1 loc y exp2 = 
    { loc = loc; tys = (x, y); exps = (exp1, exp2); leq = leq; }

  let compare c1 c2 =
    match ExtLocation.compare c1.loc c2.loc with
        0 -> lexical Ty.compare c1.tys c2.tys
      | n -> n

  let tyvars { tys = (x, y) } =
    TyVarSet.union (Ty.tyvars x) (Ty.tyvars y)

  let fresh_variant ?(create=true) ?(tyvarmap=TyVarMap.empty) loc c =
    let tyvarmap, ty1 = Ty.fresh_variant ~create ~tyvarmap ~loc:(Some loc) (fst c.tys) in
    let tyvarmap, ty2 = Ty.fresh_variant ~create ~tyvarmap ~loc:(Some loc) (snd c.tys) in
    tyvarmap, { loc = c.loc; tys = ty1, ty2; exps = (fst c.exps), (snd c.exps); leq = c.leq; }

  let print ppf { loc = loc; tys = (x, y) } =
    Format.fprintf ppf "%a =%a= %a" Ty.print x ExtLocation.print loc Ty.print y 

  let cons_print ppf ast { loc = loc; tys = (x, y); exps= (expr1, expr2); leq = leq } =
    Format.fprintf ppf "%a[\"%a\":%a] == %a[\"%a\":%a];[%a]@\n" 
    Ty.print x Ty.print_without_quote expr1 Ty.print_loc x
    Ty.print y Ty.print_without_quote expr2 Ty.print_loc y
    ExtLocation.print loc

  let type_substitute { loc = loc; tys = (x, y); exps=(exp1, exp2); leq = leq } s =
  { loc = loc ; tys = Ty.type_substitute x s, Ty.type_substitute y s; exps = exp1, exp2;  leq = leq }
end


(******************************************************************************)
(*                               AtConstrSet                                  *
 * Sets of simple constraints [AtConstr.t]. They are stored in a map by their *
 * location to make operations fast which are based on the location (and are  *
 * heavily used while constraint solving.                                     *)
(******************************************************************************)
module AtConstrSet = struct

  module SimpleAtConstrSet = struct (* scs *)
    include Set.Make(AtConstr)
    let fresh_variant ?(create=true) ?(tyvarmap=TyVarMap.empty) loc scs =
      let f c (tyvarmap, sofar) =
        let tyvarmap, ty' = AtConstr.fresh_variant ~create ~tyvarmap loc c in
        tyvarmap, add ty' sofar in
      fold f scs (tyvarmap, empty) 
    let type_substitute scs s =
      map (AtConstr.type_substitute // s) scs 
  end

  type t = SimpleAtConstrSet.t ExtLocationMap.t
  type tyvar_container = t
  type printable = t

  let empty = ExtLocationMap.empty
  let is_empty = ExtLocationMap.is_empty

  let cardinal cs =
    let f _ scs sofar = sofar + SimpleAtConstrSet.cardinal scs in
    ExtLocationMap.fold f cs 0

  let locations cs =
    let folder l _ sofar = ExtLocationSet.add l sofar in
    ExtLocationMap.fold folder cs ExtLocationSet.empty

  let add cs c =
    let addendum = 
      try SimpleAtConstrSet.add c (ExtLocationMap.find c.AtConstr.loc cs)
      with Not_found ->
        SimpleAtConstrSet.singleton c in
    ExtLocationMap.add c.AtConstr.loc addendum cs

  let from_list li =
    List.fold_left add empty li

  let union cs1 cs2 =
    let folder l scs sofar =
      let aux = 
        try ExtLocationMap.find l sofar
        with Not_found ->
          SimpleAtConstrSet.empty in
      ExtLocationMap.add l (SimpleAtConstrSet.union scs aux) sofar in
    ExtLocationMap.fold folder cs2 cs1
  let big_union css =
    List.fold_left union empty css

  let project_by_location cs l =
    ExtLocationMap.add l (ExtLocationMap.find l cs) empty

  let partition_by_location cs l  =
    project_by_location cs l, ExtLocationMap.remove l cs

  let project_by_locations cs ls  =
    let f l sofar =
      ExtLocationMap.add l (ExtLocationMap.find l cs) sofar in
    ExtLocationSet.fold f ls empty

  let singleton ty1 exp1 loc ty2 exp2 =
    ExtLocationMap.add loc (SimpleAtConstrSet.add (AtConstr.create ty1 exp1 loc ty2 exp2) SimpleAtConstrSet.empty) empty

  let all_constraints cs =
    let folder _ cs sofar = SimpleAtConstrSet.union cs sofar in
    ExtLocationMap.fold folder cs SimpleAtConstrSet.empty

  let tyvars cs =
    let folder c sofar =
      TyVarSet.union (AtConstr.tyvars c) sofar in
    SimpleAtConstrSet.fold folder (all_constraints cs) TyVarSet.empty

  let choose_location cs =
    let folder loc cs = function
      | None -> 
          if SimpleAtConstrSet.is_empty cs
          then None
          else Some loc
      | some_loc -> some_loc in
    ExtLocationMap.fold folder cs None

  let print ppf (cs:t) =
    SimpleAtConstrSet.print ppf (all_constraints cs)

  let cons_print ppf (cs:t) ast =
    SimpleAtConstrSet.iter (AtConstr.cons_print ppf ast) (all_constraints cs)

  let type_substitute cs s =
    ExtLocationMap.map (SimpleAtConstrSet.type_substitute // s) cs

  let fresh_variant ?(create=true) ?(tyvarmap=TyVarMap.empty) loc cs =
    let f loc scs (tyvarmap, sofar) =
      let tyvarmap, scs' = SimpleAtConstrSet.fresh_variant ~create ~tyvarmap loc scs in
      tyvarmap, ExtLocationMap.add loc scs' sofar in
    ExtLocationMap.fold f cs (tyvarmap, empty)

end


(******************************************************************************)
(*                                  Constr                                    * 
 * A constraint between two types annotated with a set of extended locations. *)
(******************************************************************************)


module Constr = struct

  type t = {
    locs : ExtLocationSet.t ;
    tys : Ty.t * Ty.t
  }

  type printable = t

  let create ty1 ls ty2 =
    { locs = ls ; tys = (ty1, ty2) }

  let compare c1 c2 =
    lexical2 ExtLocationSet.compare (lexical Ty.compare) (c1.locs, c1.tys) (c2.locs, c2.tys)

  let print ppf { locs = locs ; tys = (x, y) } =
    Format.fprintf ppf "%a = %a" Ty.print x Ty.print y

  let from_at_constr { AtConstr.loc = loc; tys = (x, y) } =
    create x (ExtLocationSet.singleton loc) y
end


(******************************************************************************)
(*                                ConstrSet                                   *)
(******************************************************************************)

module ConstrSet = struct

  module ConstrSet = Set.Make(Constr)

  type t = ConstrSet.t
  type printable = t

  let empty = ConstrSet.empty
  let is_empty = ConstrSet.is_empty

  let splint ds =
    if ConstrSet.is_empty ds then
      None
    else
      let c = ConstrSet.choose ds in
      Some (c, ConstrSet.remove c ds)

  let add ds c = ConstrSet.add c ds

  let union = ConstrSet.union

  let print = ConstrSet.print

  let map = ConstrSet.map

  let from_at_constr_set cs =
    let folder c sofar = ConstrSet.add (Constr.from_at_constr c) sofar in
    AtConstrSet.SimpleAtConstrSet.fold folder (AtConstrSet.all_constraints cs) ConstrSet.empty
end

(******************************************************************************)
(*                                  DerEnv                                    *
 * The derived environment used while unifying the constraints to keep track  *
 * of the type assignments so far (see Haack & Wells for more information).   *)
(******************************************************************************)

module DerEnv = struct

  type t = (Ty.t * ExtLocationSet.t) TyVarMap.t

  type printable = t

  let empty = TyVarMap.empty

  let substitute e tyvar ty locs =
    TyVarMap.add tyvar (ty, locs) e

  let lookup e tyvar =
    try Some (TyVarMap.find tyvar e)
    with Not_found -> None

  (** Apply a derived environment to a type. It computes app(E)(ty) (see Typed Error Slicing, 6.1)
    * for an derived environment E and a type ty.
    *)
  let rec apply_to_ty e ty =
    match ty with
      | Ty.Var (_, _, tyvar) ->
          begin try 
            let ty', _ = TyVarMap.find tyvar e in
            apply_to_ty e ty'
          with Not_found ->
            ty
          end
      | Ty.Constr (l, k, tys) ->
          Ty.Constr (l, k, List.map (apply_to_ty e) tys)
      | Ty.Tuple (l, tys) ->
          Ty.Tuple (l, List.map (apply_to_ty e) tys)
      | Ty.Arrow (l, tx, tx') ->
          Ty.Arrow (l, apply_to_ty e tx, apply_to_ty e tx')

  let domain env =
    TyVarMap.fold (fun tyvar _ sofar -> TyVarSet.add tyvar sofar) env TyVarSet.empty

  let print ppf e =
    let iterator tyvar (ty, locs) =
      Format.fprintf ppf "%a: %a, " TyVar.print tyvar Ty.print ty in
    Format.pp_print_string ppf "{" ;
    TyVarMap.iter iterator e ;
    Format.pp_print_string ppf "}"

  let precede_to_tyvarsubst e (TyVarSubst.S tyvarmap) =
    let adder tyvar (ty, _) sofar =
      TyVarMap.add tyvar (apply_to_ty e ty) sofar in
    let tyvarmap = TyVarMap.fold adder e tyvarmap in
    TyVarSubst.from_tyvarmap tyvarmap

  let to_tyvarsubst e =
    let f tyvar (ty, _) = apply_to_ty e ty in
    TyVarSubst.from_tyvarmap (TyVarMap.mapi f e)

end
