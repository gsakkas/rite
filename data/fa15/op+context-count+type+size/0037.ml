
let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> h :: (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,34)-(3,37)
(3,48)-(3,49)
(3,48)-(3,69)
(3,54)-(3,69)
(3,67)-(3,68)
*)

(* type error slice
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,3)-(3,69)
(3,34)-(3,37)
(3,34)-(3,37)
(3,35)-(3,36)
(3,48)-(3,49)
(3,48)-(3,69)
(3,48)-(3,69)
*)
