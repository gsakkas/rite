
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append ((listReverse t), [h]);;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append [h] [h];;

*)

(* changed spans
(5,37)-(5,65)
(5,46)-(5,57)
(5,46)-(5,59)
(5,46)-(5,65)
(5,58)-(5,59)
*)

(* type error slice
(2,24)-(2,76)
(2,24)-(2,76)
(2,65)-(2,71)
(2,65)-(2,76)
(2,72)-(2,73)
(5,37)-(5,43)
(5,37)-(5,65)
(5,46)-(5,65)
*)
