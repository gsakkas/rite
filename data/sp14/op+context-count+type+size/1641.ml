
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
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,35)-(3,39)
(3,35)-(3,39)
(3,36)-(3,38)
(3,50)-(3,51)
(3,50)-(3,69)
(3,50)-(3,69)
*)
