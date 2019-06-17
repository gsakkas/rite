
let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse append (t [h]);;


(* fix

let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(5,50)-(5,76)
listReverse (append t [h])
AppG [AppG [EmptyG,EmptyG]]

*)

(* type error slice
(4,4)-(5,78)
(4,21)-(5,76)
(5,3)-(5,76)
(5,50)-(5,61)
(5,50)-(5,76)
(5,69)-(5,76)
(5,70)-(5,71)
*)
