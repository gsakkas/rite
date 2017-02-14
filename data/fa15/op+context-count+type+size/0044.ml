
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> h @ (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,46)-(3,47)
(3,64)-(3,65)
*)

(* type error slice
(3,3)-(3,66)
(3,3)-(3,66)
(3,3)-(3,66)
(3,3)-(3,66)
(3,3)-(3,66)
(3,34)-(3,35)
(3,46)-(3,47)
(3,46)-(3,66)
(3,48)-(3,49)
*)
