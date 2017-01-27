
let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> list1 :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (append t [h]);;


(* fix

let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> list1 :: list2;;

let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append [] t);;

let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(5,21)-(6,62)
(6,3)-(6,62)
(6,9)-(6,10)
(6,24)-(6,26)
(6,37)-(6,48)
(6,37)-(6,62)
(6,50)-(6,62)
(6,57)-(6,58)
(6,59)-(6,62)
(6,60)-(6,61)
*)

(* type error slice
(2,4)-(3,60)
(2,12)-(3,58)
(2,18)-(3,58)
(3,3)-(3,58)
(3,9)-(3,14)
(3,28)-(3,33)
(3,44)-(3,49)
(3,44)-(3,58)
(3,53)-(3,58)
(6,3)-(6,62)
(6,50)-(6,56)
(6,50)-(6,62)
(6,57)-(6,58)
(6,59)-(6,62)
(6,60)-(6,61)
*)
