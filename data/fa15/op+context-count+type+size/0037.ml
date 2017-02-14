
let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> h :: (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,33)-(3,36)
(3,47)-(3,48)
(3,47)-(3,69)
(3,52)-(3,69)
(3,66)-(3,67)
*)

(* type error slice
(3,2)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,33)-(3,36)
(3,33)-(3,36)
(3,34)-(3,35)
(3,47)-(3,48)
(3,47)-(3,69)
(3,47)-(3,69)
*)
