
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest = t
        else h :: (seen' helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,21)-(7,23)
h :: seen
ConAppG (Just (TupleG (fromList [EmptyG])))

(8,21)-(8,31)
t
VarG

(9,9)-(11,48)
helper (seen' , rest')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(7,9)-(11,48)
(7,21)-(7,23)
(9,9)-(11,48)
(10,14)-(10,22)
(11,14)-(11,48)
(11,19)-(11,48)
(11,20)-(11,25)
*)
