
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: l;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,36)-(3,51)
h
VarG

*)
