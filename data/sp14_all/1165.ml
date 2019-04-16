
let rec listReverse l =
  match l with | [] -> [] | a::[] -> [a] | a::b::[] -> b :: (listReverse a);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,3)-(3,76)
match l with
| [] -> []
| a :: b -> listReverse b @ [a]
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(3,78)
(2,21)-(3,76)
(3,3)-(3,76)
(3,9)-(3,10)
(3,61)-(3,76)
(3,62)-(3,73)
(3,74)-(3,75)
*)
