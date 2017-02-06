
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
(2,4)-(3,73)
(2,21)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,9)-(3,10)
(3,24)-(3,26)
(3,37)-(3,38)
(3,37)-(3,69)
(3,43)-(3,54)
(3,43)-(3,69)
(3,43)-(3,69)
(3,56)-(3,67)
(3,56)-(3,69)
(3,56)-(3,69)
(3,68)-(3,69)
*)
