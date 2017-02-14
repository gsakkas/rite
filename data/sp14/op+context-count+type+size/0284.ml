
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
(5,20)-(6,62)
(6,2)-(6,62)
(6,8)-(6,9)
(6,23)-(6,25)
(6,36)-(6,47)
(6,36)-(6,62)
(6,48)-(6,62)
(6,56)-(6,57)
(6,58)-(6,61)
(6,59)-(6,60)
*)

(* type error slice
(2,3)-(3,59)
(2,11)-(3,57)
(2,17)-(3,57)
(3,43)-(3,48)
(3,43)-(3,57)
(3,43)-(3,57)
(3,52)-(3,57)
(6,2)-(6,62)
(6,2)-(6,62)
(6,48)-(6,62)
(6,49)-(6,55)
(6,56)-(6,57)
(6,58)-(6,61)
(6,58)-(6,61)
(6,59)-(6,60)
*)
