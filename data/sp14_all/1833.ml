
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
(6,37)-(6,62)
append t [h]
AppG [VarG,ListG [EmptyG]]

*)

(* type error slice
(3,49)-(3,65)
(3,50)-(3,56)
(6,3)-(6,62)
(6,24)-(6,26)
(6,37)-(6,43)
(6,37)-(6,62)
*)
