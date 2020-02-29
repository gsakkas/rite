let removeDuplicates =
  fun l ->
    (let rec helper =
       fun (seen , rest) ->
         match rest with
         | [] -> seen
         | h :: t -> (let seen' =
                        if __var_1__
                        then seen
                        else h :: seen in
                      let rest' = t in
                      helper (seen' , rest')) in
     List.rev (helper ([] , l)))


(* -------------------------------------- *)


(* bad

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* student fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h seen) then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans

(7,24)-(7,43)
not (List.mem h seen)
AppG [AppG [EmptyG,EmptyG]]

*)
