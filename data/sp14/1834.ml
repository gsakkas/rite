
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append (t [h]);;


(* fix

let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append t [h];;

*)

(* changed spans
(5,59)-(5,73)
append t [h]
AppG [VarG,ListG [EmptyG]]

*)

(* type error slice
(3,49)-(3,65)
(3,50)-(3,56)
(5,25)-(5,73)
(5,46)-(5,48)
(5,59)-(5,65)
(5,59)-(5,73)
(5,66)-(5,73)
(5,67)-(5,68)
*)
