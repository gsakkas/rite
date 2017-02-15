
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> h @ (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,45)-(3,46)
(3,62)-(3,63)
*)

(* type error slice
(3,2)-(3,64)
(3,2)-(3,64)
(3,2)-(3,64)
(3,2)-(3,64)
(3,2)-(3,64)
(3,33)-(3,34)
(3,45)-(3,46)
(3,45)-(3,64)
(3,47)-(3,48)
*)
