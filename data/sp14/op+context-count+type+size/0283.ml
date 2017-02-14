
let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append (t [h]));;


(* fix

let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(5,63)-(5,76)
(5,71)-(5,76)
*)

(* type error slice
(2,4)-(2,80)
(2,16)-(2,78)
(2,22)-(2,78)
(4,4)-(5,80)
(4,21)-(5,76)
(5,3)-(5,76)
(5,3)-(5,76)
(5,3)-(5,76)
(5,3)-(5,76)
(5,9)-(5,10)
(5,50)-(5,61)
(5,50)-(5,76)
(5,63)-(5,69)
(5,63)-(5,76)
(5,71)-(5,72)
(5,71)-(5,76)
*)
