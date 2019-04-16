
let rec listReverse l =
  match l with | [] -> [] | a::b::[] -> (listReverse b) @ a;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,3)-(3,60)
match l with
| [] -> []
| a :: b -> listReverse b @ [a]
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(3,62)
(2,21)-(3,60)
(3,3)-(3,60)
(3,9)-(3,10)
(3,41)-(3,56)
(3,42)-(3,53)
(3,54)-(3,55)
*)
