open EzyUtils
open EzyAst
open EzyOcamlmodules

exception InternalMaskError of string


let magic_filter : ?f:('a -> 'b) -> ?p:('b -> 'b -> bool) -> 'a list -> 'b list =
  fun ?f ?p al ->
 
      List.fold_right 
        (fun a bl  -> 
           let b = (match f with None -> a | Some f -> f a ) in
             match bl with 
               | [] -> [b]
               | b2::_ -> 
                   match p with 
                       None -> b :: bl
                     | Some p ->
                         if (p b b2) then
                           bl
                         else
                           b :: bl
        )
        al
        []
 
      
let rec mask_item = function
  | Dot_str {pstr_desc = Pstr_dots il ; }
  | Dot_exp {pexp_desc = Pexp_dots il ; } 
  | Dot_pat {ppat_desc = Ppat_dots il ; }  -> mask il
  | s -> [s]

and mask il = List.flatten (List.map mask_item il)

let mask_final sil = 
  let masked = mask (List.map (fun x -> Dot_str x) sil) in
    List.map (function (Dot_str s) -> s | _ -> assert false) masked


let get_location_list_of_pattern_tuple pos pel =
  List.fold_left
    (fun ls { ppat_loc = pl } -> pl :: ls)
    []
    (List.map pos pel) 
    
let get_location_list_of_name_X_tuple nel = 
  List.fold_left 
    (fun ls { nm_loc = nl } -> nl :: ls) 
    [] 
    (List.map (fun (n,_) -> n) nel)  
    

  

let get_location_list_of_expression el =
  List.map (fun { pexp_loc = l } -> l) el

let get_location_list_of_pattern pl =
  List.map (fun { ppat_loc = l } -> l) pl
    
let get_location_list_of_x_expression_tuple el =
  List.fold_left
    (fun ls { pexp_loc = l } -> l :: ls)
    []
    (List.map snd el) 
    
let is_pedot_tuple (p,e) =
  match (p,e) with
    | ({ppat_desc = Ppat_dots []},{pexp_desc = Pexp_dots []}) -> true
    | _ -> false

let is_nedot_tuple ({nm_loc = l;},e) lset =
  match e with
    | {pexp_desc = Pexp_dots []} -> LocationSet.mem l lset
    | _ -> false
  
     
let rec create_slices : ('expr_data, 'id_data, 'nm_data, 'pat_data) structure -> 
  ExtLocationSet.t -> ('expr_data, 'id_data, 'nm_data, 'pat_data) structure =
  fun ast lset ->
    List.map (fun si -> create_sliced_str_item si (ExtLocationSet.filterSourceLocations lset)) ast
      
 
and create_sliced_str_item : ('expr_data, 'id_data, 'nm_data, 'pat_data) structure_item -> 
  LocationSet.t -> ('expr_data, 'id_data, 'nm_data, 'pat_data) structure_item =
  fun ({pstr_desc = s; pstr_loc = l;} as s_str) lset -> 
    
    let do_if_one_member ls f g =
      if (List.exists (fun l -> LocationSet.mem l lset) ls)  then 
        f () 
      else
        g ()
    in
      (* heufig verwendete Fälle *)
    let strdesc_to_str str_desc () = { s_str with pstr_desc = str_desc } in
    let il_to_str il = strdesc_to_str (Pstr_dots il) in

    let mask_e es = mask (List.map (fun e -> Dot_exp e) es) in
    let do_mask_exp es = il_to_str (mask_e es) in

    let ident () = s_str in
      
      match s with
        | Pstr_eval e ->
            let sliced_e = create_sliced_exp e lset in
              (strdesc_to_str (Pstr_eval sliced_e) ()) 

        | Pstr_value pel ->
            begin
              let llist = get_location_list_of_pattern_tuple fst pel in
              let sliced_pels = create_sliced_pels pel lset in
                match pel with
                  | [] -> il_to_str [] ()
                  | _ -> (do_if_one_member (l :: llist) 
                            (strdesc_to_str (Pstr_value (sliced_pels)))
                            (do_mask_exp (List.map snd sliced_pels)))
            end
        | Pstr_rec_value nel -> 
            begin
              let llist = get_location_list_of_name_X_tuple nel in
              let sliced_nels = create_sliced_nels nel lset in
                match nel with
                  | [] -> il_to_str [] ()
                  | _ -> (do_if_one_member (l :: llist) 
                            (strdesc_to_str (Pstr_rec_value (sliced_nels)))
                            (do_mask_exp (List.map snd sliced_nels)))
            end
        | Pstr_type ntdl -> 
            let llist = get_location_list_of_name_X_tuple ntdl in               
              do_if_one_member llist 
                (strdesc_to_str (Pstr_type (create_sliced_ntdl ntdl lset))) 
                (il_to_str [])  
        | Pstr_exception ({nm_loc = nl},ct) -> 
            do_if_one_member [nl;l]
              (ident)
              (il_to_str []) 
              
        | Pstr_open _ ->
            do_if_one_member [l]
                (ident)
                (il_to_str []) 

        | Pstr_dots il ->
            let sliced_il = List.map (fun i -> create_sliced_dots i lset) il  in
                il_to_str (mask sliced_il) ()

and create_sliced_pat :  ('expr_data, 'id_data, 'nm_data, 'pat_data) pattern ->
  LocationSet.t -> ('expr_data, 'id_data, 'nm_data, 'pat_data) pattern =
  fun ({ ppat_desc = pdesc;
         ppat_loc = l;
         ppat_data = d;
       } as p_pat )  
    lset -> 
       
      let do_if_one_member ls f g =
        if (List.exists (fun l -> LocationSet.mem l lset) ls)  then 
          f () 
        else
          g ()
      in
        
      (* heufig verwendete Fälle *)
      let pdesc_to_pat pdesc () = { p_pat with ppat_desc = pdesc } in      
      let il_to_pat il = pdesc_to_pat (Ppat_dots il) in
      let mask_p ps = mask (List.map (fun p -> Dot_pat p) ps) in
      let do_mask ps = il_to_pat (mask_p ps) in
      let ident () = p_pat in

        match pdesc with
          | Ppat_constant _
          | Ppat_any ->
              do_if_one_member [l]
                (ident)
                (il_to_pat []) 

          | Ppat_var ({nm_loc = nl}) -> 
            do_if_one_member [nl;l]
              (ident)
              (il_to_pat []) 
              
          | Ppat_tuple pl ->
              let llist = get_location_list_of_pattern pl in              
              do_if_one_member (l::llist)
                (pdesc_to_pat (Ppat_tuple (create_sliced_pl pl lset)))
                (il_to_pat []) 

          | Ppat_construct (i,po,b) -> begin
              match po with 
                | None -> 
                    do_if_one_member [l]
                      (ident)
                      (il_to_pat []) 
                | Some ({ppat_loc = pl } as p) -> 
                    let sliced_p = create_sliced_pat p lset in
                      do_if_one_member [l]
                        (pdesc_to_pat (Ppat_construct (i,Some sliced_p,b)))
                        (do_mask [sliced_p]) 
            end
              
          | Ppat_record ipl ->
              let sliced_pl = List.map (fun (i,p) -> (i,create_sliced_pat p lset)) ipl in
                do_if_one_member [l]
                  (pdesc_to_pat (Ppat_record (sliced_pl)))
                  (do_mask (List.map snd sliced_pl))

          | Ppat_or (p1,p2) ->
              let sliced_p1 = create_sliced_pat p1 lset in
              let sliced_p2 = create_sliced_pat p2 lset in
                do_if_one_member [l]
                  (pdesc_to_pat (Ppat_or (sliced_p1,sliced_p2)))
                  (do_mask [sliced_p1;sliced_p2])
          | Ppat_constraint (p,ct) ->
              let sliced_p = create_sliced_pat p lset in
                do_if_one_member [l]
                  (pdesc_to_pat (Ppat_constraint (sliced_p,ct)))
                  (do_mask [sliced_p])
          | Ppat_alias (p, ({nm_loc = nl} as n)) ->
              let sliced_p = create_sliced_pat p lset in
                do_if_one_member [l;nl]
                  (pdesc_to_pat (Ppat_alias (sliced_p,n)))
                  (do_mask [p])
          | Ppat_dots il ->
              let sliced_il = List.map (fun i -> create_sliced_dots i lset) il  in
                il_to_pat (mask sliced_il) ()
              
and create_sliced_exp : ('expr_data, 'id_data, 'nm_data, 'pat_data) expression ->
  LocationSet.t -> ('expr_data, 'id_data, 'nm_data, 'pat_data) expression =
  fun ({ pexp_desc = edesc;
         pexp_loc = l;
         pexp_data = d;
       } as e_exp )  
    lset -> 

      let do_if_one_member ls f g =
        if (List.exists (fun l -> LocationSet.mem l lset) ls)  then 
          f () 
        else
          g ()
      in

      (* heufig verwendete Fälle *)
      let edesc_to_exp edesc () = { e_exp with pexp_desc = edesc } in      
      let il_to_exp il = edesc_to_exp (Pexp_dots il) in
      let mask_e es = mask (List.map (fun e -> Dot_exp e) es) in
      let do_mask es = il_to_exp (mask_e es) in
      let ident () = e_exp in

        match edesc with
          | Pexp_ident _ 
          | Pexp_constant _ 
          | Pexp_assertfalse ->
              do_if_one_member [l] ident (il_to_exp []) 
                
          | Pexp_let (pel,e)  ->
              let llist = get_location_list_of_pattern_tuple fst pel in
              let sliced_pels = create_sliced_pels pel lset in
              let sliced_e = create_sliced_exp e lset in
                do_if_one_member (l :: llist) 
                  (edesc_to_exp (Pexp_let (sliced_pels, sliced_e)))
                  (do_mask ((List.map snd sliced_pels ) @[sliced_e]))

          | Pexp_letrec (nel,e) ->
              let llist = get_location_list_of_name_X_tuple nel in

              let sliced_nels = create_sliced_nels nel lset in
              let sliced_e = create_sliced_exp e lset in
                do_if_one_member (l :: llist) 
                  (edesc_to_exp (Pexp_letrec (sliced_nels, sliced_e)))
                  (do_mask ((List.map snd sliced_nels ) @ [sliced_e]))
                  
          | Pexp_function rl ->
              let llist = get_location_list_of_pattern_tuple fst rl  in
            
              let sliced_rl = create_sliced_pels rl lset in 
                do_if_one_member (l::llist) 
                  (edesc_to_exp (Pexp_function sliced_rl))
                  (do_mask (List.map snd sliced_rl))

          | Pexp_apply (e1, e2) ->
              let sliced_e1 = create_sliced_exp e1 lset in
              let sliced_e2 = create_sliced_exp e2 lset in
                do_if_one_member [l]
                  (edesc_to_exp (Pexp_apply (sliced_e1,sliced_e2)))
                  (do_mask [sliced_e1; sliced_e2])
              
          | Pexp_match (e,rl) ->
              let llist = get_location_list_of_pattern_tuple fst rl in
              let sliced_rl = create_sliced_pels rl lset in 
              let sliced_e = create_sliced_exp e lset in
                do_if_one_member (l::llist) 
                  (edesc_to_exp (Pexp_match (sliced_e,sliced_rl)))
                  (do_mask (sliced_e :: (List.map snd sliced_rl)))


          | Pexp_try (e,rl) ->
              let llist = get_location_list_of_pattern_tuple fst rl in
              let sliced_rl = create_sliced_pels rl lset in
              let sliced_e = create_sliced_exp e lset in
                do_if_one_member (l::llist) 
                  (edesc_to_exp (Pexp_try (sliced_e,sliced_rl)))
                  (do_mask (sliced_e :: (List.map snd sliced_rl)))

          | Pexp_tuple el ->
              let llist = get_location_list_of_expression el in
              let sliced_el = List.map (fun e -> create_sliced_exp e lset) el  in
                do_if_one_member (l::llist) 
                  (edesc_to_exp (Pexp_tuple sliced_el))
                  (do_mask sliced_el)

          | Pexp_construct (i,eopt,b) -> 
              do_if_one_member [l]
                (edesc_to_exp 
                   (Pexp_construct 
                      (i,Option.map eopt (fun e -> create_sliced_exp e lset),b)))
                (do_mask ((function 
                               None -> [] 
                             | Some e -> [create_sliced_exp e lset]) 
                            eopt))
              
          | Pexp_record (iel,eopt) ->
              let sliced_el = create_sliced_iel iel lset in 
                do_if_one_member [l] 
                  (edesc_to_exp (Pexp_record (sliced_el,(Option.map eopt (fun e -> create_sliced_exp e lset)))))
                  (do_mask (((function 
                                  None -> [] 
                                | Some e -> [create_sliced_exp e lset]) 
                               eopt)@ (List.map snd sliced_el )))

                  
          | Pexp_field (e,i) ->
              let sliced_e = create_sliced_exp e lset in
                do_if_one_member [l]
                  (edesc_to_exp (Pexp_field (sliced_e,i)))
                  (do_mask [sliced_e])
                  

          | Pexp_setfield (e1,i,e2) ->
              let sliced_e1 = create_sliced_exp e1 lset in
              let sliced_e2 = create_sliced_exp e2 lset in
                do_if_one_member [l]
                  (edesc_to_exp (Pexp_setfield (sliced_e1,i,sliced_e2)))
                  (do_mask [sliced_e1;sliced_e2])
                

          | Pexp_ifthenelse (e1,e2,eopt3) ->
              let sliced_e1 = create_sliced_exp e1 lset in
              let sliced_e2 = create_sliced_exp e2 lset in
                do_if_one_member [l]
                  (edesc_to_exp (Pexp_ifthenelse (sliced_e1,sliced_e2,
                                                  (Option.map eopt3 (fun e -> create_sliced_exp e lset)))))
                  (do_mask ([sliced_e1;sliced_e2]@(function 
                                                       None -> [] 
                                                     | Some e -> [create_sliced_exp e lset]) 
                              eopt3))
                  
          | Pexp_sequence (e1,e2) ->
              let sliced_e1 = create_sliced_exp e1 lset in
              let sliced_e2 = create_sliced_exp e2 lset in
                do_if_one_member [l]
                  (edesc_to_exp (Pexp_sequence (sliced_e1,sliced_e2)))
                  (do_mask [sliced_e1;sliced_e2])
                
          | Pexp_while (e1,e2) ->
              let sliced_e1 = create_sliced_exp e1 lset in
              let sliced_e2 = create_sliced_exp e2 lset in
                do_if_one_member [l]
                  (edesc_to_exp (Pexp_while (sliced_e1,sliced_e2)))
                  (do_mask [sliced_e1;sliced_e2])
                
          | Pexp_for (n,e1,e2,flag,e3) ->
              (* TODO slice names???!!!*)  
              let sliced_e1 = create_sliced_exp e1 lset in
              let sliced_e2 = create_sliced_exp e2 lset in
              let sliced_e3 = create_sliced_exp e3 lset in
                do_if_one_member [l]
                  (edesc_to_exp (Pexp_for (n,sliced_e1,sliced_e2,flag,sliced_e3)))
                  (do_mask [sliced_e1;sliced_e2;sliced_e3])
                  
          | Pexp_assert e ->
              let sliced_e = create_sliced_exp e lset in
                do_if_one_member [l]
                  (edesc_to_exp (Pexp_assert e))
                  (do_mask [sliced_e])
         
          | Pexp_dots il -> 
              let sliced_il = List.map (fun i -> create_sliced_dots i lset) il  in
                il_to_exp (mask sliced_il) ()

          | Pexp_constraint (e, ct) ->
              let sliced_e = create_sliced_exp e lset in
              let error_locs_in_ct = LocationSet.inter lset (CollectLocs.core_type ct) in
              if LocationSet.is_empty error_locs_in_ct then
                sliced_e
              else
                edesc_to_exp (Pexp_constraint (sliced_e, ct)) ()
               
(*
and create_sliced_core_type : core_type -> LocationSet.t -> core_type =
  fun ct lset ->
    match ct.ptyp_desc with
      | Ptyp_any
      | Ptyp_var of string
      | Ptyp_arrow of label * core_type * core_type
      | Ptyp_tuple of core_type list
      | Ptyp_constr of Longident.t * core_type list
      | Ptyp_object of Parsetree.core_field_type list
      | Ptyp_class of Longident.t * core_type list * label list
      | Ptyp_alias of core_type * string
      | Ptyp_variant of Parsetree.row_field list * bool * label list option
      | Ptyp_poly of string list * core_type
 *)

and create_sliced_dots : ('expr_data, 'id_data, 'nm_data, 'pat_data) dot_item -> 
  LocationSet.t -> ('expr_data, 'id_data, 'nm_data, 'pat_data) dot_item = 
  fun di lset -> 
    match di with
  | Dot_str strit ->
      Dot_str (create_sliced_str_item strit lset)
  | Dot_exp exp ->
      Dot_exp (create_sliced_exp exp lset)
  | Dot_pat pat ->
      Dot_pat (create_sliced_pat pat lset)

and create_sliced_pels pel lset = 
  magic_filter
    ~f:(fun (p,e) -> (create_sliced_pat p lset,create_sliced_exp e lset))
    ~p:(fun p1 p2 -> (is_pedot_tuple p1) && (is_pedot_tuple p2))
    pel

and create_sliced_nels nel lset = 
  magic_filter 
    ~f:(fun (n,e) -> (n,create_sliced_exp e lset))
    ~p:(fun n1 n2 -> 
          (is_nedot_tuple n1 lset) && (is_nedot_tuple n2 lset))
    nel

and create_sliced_ntdl ntdl lset =
  magic_filter 
    ~p:(fun ({nm_loc = l1},_) ({nm_loc = l2},_) -> 
       (not(LocationSet.mem l1 lset)) && (not(LocationSet.mem l2 lset)))
    ntdl

and create_sliced_pl pl lset =
  magic_filter 
    ~f:(fun p -> create_sliced_pat p lset)
    pl 
    
and create_sliced_el el lset =
  magic_filter 
    ~f:(fun e -> create_sliced_exp e lset)
    el 
    
and create_sliced_iel iel lset = 
  magic_filter 
    ~f:(fun (i,e) -> (i,create_sliced_exp e lset))        
    iel


