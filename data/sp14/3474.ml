
let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> t :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,54)-(3,55)
h
VarG

*)

(* type error slice
(3,3)-(3,74)
(3,39)-(3,43)
(3,40)-(3,42)
(3,54)-(3,55)
(3,54)-(3,74)
*)
