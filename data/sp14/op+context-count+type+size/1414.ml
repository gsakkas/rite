
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append ((listReverse t), [h]);;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append [h] [h];;

*)

(* changed spans
(5,36)-(5,65)
(5,43)-(5,65)
(5,44)-(5,59)
(5,45)-(5,56)
(5,57)-(5,58)
*)

(* type error slice
(2,23)-(2,76)
(2,23)-(2,76)
(2,63)-(2,76)
(2,64)-(2,70)
(2,71)-(2,72)
(5,36)-(5,42)
(5,36)-(5,65)
(5,43)-(5,65)
*)
