
let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> t @ (listReverse [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,33)-(3,36)
*)

(* type error slice
(3,2)-(3,68)
(3,2)-(3,68)
(3,2)-(3,68)
(3,2)-(3,68)
(3,2)-(3,68)
(3,33)-(3,36)
(3,33)-(3,36)
(3,34)-(3,35)
(3,47)-(3,48)
(3,47)-(3,68)
(3,49)-(3,50)
*)
