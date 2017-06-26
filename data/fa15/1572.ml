
let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,60)-(3,62)
*)

(* type error slice
(3,2)-(3,62)
(3,8)-(3,9)
(3,23)-(3,24)
(3,39)-(3,62)
(3,58)-(3,59)
(3,60)-(3,62)
*)

(* all spans
(2,20)-(3,62)
(3,2)-(3,62)
(3,8)-(3,9)
(3,23)-(3,24)
(3,39)-(3,62)
(3,58)-(3,59)
(3,39)-(3,57)
(3,40)-(3,51)
(3,52)-(3,56)
(3,60)-(3,62)
*)
