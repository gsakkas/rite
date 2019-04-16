
let rec listReverse l =
  match l with | [] -> [] | h1 -> [h1] | h::t -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,3)-(3,70)
match l with
| [] -> []
| h1 :: [] -> [h1]
| h :: t -> h :: (listReverse t)
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ConAppG (Just EmptyG)),(ConsPatG VarPatG (ConPatG Nothing),Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(3,3)-(3,70)
(3,35)-(3,39)
(3,36)-(3,38)
(3,50)-(3,51)
(3,50)-(3,70)
*)
