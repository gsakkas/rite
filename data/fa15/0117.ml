
let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t :: (listReverse [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,45)-(3,46)
(3,45)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,33)-(3,34)
(3,45)-(3,46)
(3,45)-(3,67)
*)

(* all spans
(2,20)-(3,67)
(3,2)-(3,67)
(3,8)-(3,9)
(3,23)-(3,25)
(3,33)-(3,34)
(3,45)-(3,67)
(3,45)-(3,46)
(3,50)-(3,67)
(3,51)-(3,62)
(3,63)-(3,66)
(3,64)-(3,65)
*)
