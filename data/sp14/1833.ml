
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append [listReverse t; h];;


(* fix

let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append t [h];;

*)

(* changed spans
(6,36)-(6,61)
(6,43)-(6,61)
(6,44)-(6,55)
(6,44)-(6,57)
(6,59)-(6,60)
*)

(* type error slice
(3,48)-(3,64)
(3,49)-(3,55)
(6,2)-(6,61)
(6,23)-(6,25)
(6,36)-(6,42)
(6,36)-(6,61)
*)

(* all spans
(2,15)-(3,64)
(2,21)-(3,64)
(3,2)-(3,64)
(3,8)-(3,13)
(3,27)-(3,32)
(3,43)-(3,64)
(3,43)-(3,44)
(3,48)-(3,64)
(3,49)-(3,55)
(3,56)-(3,57)
(3,58)-(3,63)
(5,20)-(6,61)
(6,2)-(6,61)
(6,8)-(6,9)
(6,23)-(6,25)
(6,36)-(6,61)
(6,36)-(6,42)
(6,43)-(6,61)
(6,44)-(6,57)
(6,44)-(6,55)
(6,56)-(6,57)
(6,59)-(6,60)
*)
