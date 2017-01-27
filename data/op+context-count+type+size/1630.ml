
let rec listReverse l =
  match l with | [] -> [] | h1 -> [h1] | h::t -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,3)-(3,69)
*)

(* type error slice
(2,4)-(3,72)
(2,21)-(3,69)
(3,3)-(3,69)
(3,9)-(3,10)
(3,24)-(3,26)
(3,50)-(3,69)
(3,56)-(3,67)
(3,56)-(3,69)
(3,68)-(3,69)
*)
