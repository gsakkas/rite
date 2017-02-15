
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t; [h]);;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append [h] [h];;

*)

(* changed spans
(5,36)-(5,63)
(5,43)-(5,63)
(5,44)-(5,55)
(5,44)-(5,57)
(5,56)-(5,57)
(5,60)-(5,61)
*)

(* type error slice
(2,63)-(2,76)
(2,64)-(2,70)
(4,3)-(5,65)
(4,20)-(5,63)
(5,2)-(5,63)
(5,2)-(5,63)
(5,23)-(5,25)
(5,36)-(5,42)
(5,36)-(5,63)
(5,43)-(5,63)
(5,44)-(5,55)
(5,44)-(5,57)
*)
