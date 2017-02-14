
let rec listReverse l =
  match l with | [] -> [] | h1 -> [h1] | h::t -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,2)-(3,69)
*)

(* type error slice
(3,2)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,34)-(3,38)
(3,34)-(3,38)
(3,35)-(3,37)
(3,49)-(3,50)
(3,49)-(3,69)
(3,49)-(3,69)
*)
