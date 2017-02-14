
let rec listReverse l =
  match l with | [] -> [] | hd::tail -> (listReverse tail) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,24)-(3,26)
(3,42)-(3,58)
(3,42)-(3,65)
(3,63)-(3,65)
*)

(* type error slice
(2,4)-(3,67)
(2,21)-(3,65)
(3,3)-(3,65)
(3,42)-(3,53)
(3,42)-(3,58)
(3,42)-(3,65)
(3,42)-(3,65)
*)
