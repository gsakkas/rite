
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | h::t -> h :: (listReverse t) | [] -> [];;

*)

(* changed spans
(2,25)-(2,77)
match l with
| h :: t -> h :: (listReverse t)
| [] -> []
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ConAppG (Just EmptyG)),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(2,79)
(2,21)-(2,77)
(2,25)-(2,77)
(2,59)-(2,77)
(2,60)-(2,71)
(2,60)-(2,73)
*)
