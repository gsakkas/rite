
let rec listReverse l = match l with | [] -> [l] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | h::t -> h :: (listReverse t) | [] -> [];;

*)

(* changed spans
(2,25)-(2,78)
match l with
| h :: t -> h :: (listReverse t)
| [] -> []
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ConAppG (Just EmptyG)),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,25)-(2,78)
(2,31)-(2,32)
(2,46)-(2,49)
(2,47)-(2,48)
(2,60)-(2,78)
(2,76)-(2,77)
*)
