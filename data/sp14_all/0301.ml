
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse h));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse l));;

*)

(* changed spans
(3,67)-(3,68)
l
VarG

*)
