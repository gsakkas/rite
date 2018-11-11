
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse l);;

*)

(* changed spans
(2,58)-(2,76)
h :: (listReverse l)
ConAppG (Just (TupleG [VarG,AppG [VarG]])) Nothing

(2,59)-(2,72)
h
VarG

(2,74)-(2,75)
l
VarG

*)
