
let rec listReverse l =
  match l with | h::[] -> h | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,2)-(3,56)
(3,26)-(3,27)
(3,38)-(3,56)
(3,54)-(3,55)
*)

(* type error slice
(3,2)-(3,56)
(3,2)-(3,56)
(3,2)-(3,56)
(3,2)-(3,56)
(3,2)-(3,56)
(3,2)-(3,56)
(3,26)-(3,27)
(3,38)-(3,56)
(3,38)-(3,56)
(3,54)-(3,55)
*)
