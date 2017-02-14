
let rec listReverse l =
  match l with | [] -> [] | hd::tail -> (listReverse tail) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,23)-(3,25)
(3,40)-(3,58)
(3,40)-(3,64)
(3,62)-(3,64)
*)

(* type error slice
(2,3)-(3,66)
(2,20)-(3,64)
(3,2)-(3,64)
(3,40)-(3,58)
(3,40)-(3,64)
(3,40)-(3,64)
(3,41)-(3,52)
*)
