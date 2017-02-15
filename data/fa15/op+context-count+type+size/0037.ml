
let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> h @ (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,2)-(3,66)
(3,33)-(3,34)
(3,45)-(3,46)
(3,63)-(3,64)
*)

(* type error slice
(3,2)-(3,66)
(3,2)-(3,66)
(3,2)-(3,66)
(3,2)-(3,66)
(3,2)-(3,66)
(3,33)-(3,34)
(3,45)-(3,46)
(3,45)-(3,66)
(3,47)-(3,48)
*)
