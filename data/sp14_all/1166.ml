
let rec listReverse l = match l with | [] -> [] | a::b -> [listReverse b; a];;


(* fix

let rec listReverse l = match l with | [] -> [] | b::[] -> [b];;

*)

(* changed spans
(2,25)-(2,77)
match l with
| [] -> []
| b :: [] -> [b]
CaseG VarG (fromList [(ConsPatG VarPatG (ConPatG Nothing),Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(2,79)
(2,21)-(2,77)
(2,25)-(2,77)
(2,59)-(2,77)
(2,60)-(2,71)
(2,60)-(2,73)
*)
