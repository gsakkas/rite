
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse h));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse l));;

*)

(* changed spans
(3,68)-(3,69)
*)

(* type error slice
(3,37)-(3,38)
(3,37)-(3,69)
(3,37)-(3,69)
(3,43)-(3,54)
(3,43)-(3,69)
(3,56)-(3,67)
(3,56)-(3,69)
(3,68)-(3,69)
*)
