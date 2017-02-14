
let rec listReverse l =
  match l with | [] -> [] | (h::tail)::[] -> listReverse tail;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

*)

(* changed spans
(3,3)-(3,62)
(3,46)-(3,62)
*)

(* type error slice
(2,4)-(3,64)
(2,21)-(3,62)
(3,3)-(3,62)
(3,3)-(3,62)
(3,3)-(3,62)
(3,9)-(3,10)
(3,46)-(3,57)
(3,46)-(3,62)
(3,58)-(3,62)
*)
