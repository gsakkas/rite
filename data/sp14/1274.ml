
let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> append_new listReverse tail [head];;


(* fix

let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let rec listReverse l =
  match l with
  | [] -> []
  | head::tail -> append_new (listReverse tail) [head];;

*)

(* changed spans
(6,42)-(6,76)
(6,53)-(6,64)
*)

(* type error slice
(3,45)-(3,74)
(3,53)-(3,74)
(3,54)-(3,64)
(6,42)-(6,52)
(6,42)-(6,76)
*)

(* all spans
(2,19)-(3,74)
(2,23)-(3,74)
(3,2)-(3,74)
(3,8)-(3,11)
(3,25)-(3,28)
(3,45)-(3,74)
(3,45)-(3,49)
(3,53)-(3,74)
(3,54)-(3,64)
(3,65)-(3,69)
(3,70)-(3,73)
(5,20)-(6,76)
(6,2)-(6,76)
(6,8)-(6,9)
(6,23)-(6,25)
(6,42)-(6,76)
(6,42)-(6,52)
(6,53)-(6,64)
(6,65)-(6,69)
(6,70)-(6,76)
(6,71)-(6,75)
*)
