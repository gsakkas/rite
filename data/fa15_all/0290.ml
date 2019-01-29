
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> listReverse (h :: l);;

*)

(* changed spans
(2,58)-(2,76)
l
VarG

(2,71)-(2,72)
h :: l
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

*)
