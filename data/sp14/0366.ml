
let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> (listReverse t) :: h;;


(* fix

let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(2,20)-(3,69)
(3,49)-(3,69)
(3,62)-(3,63)
(3,68)-(3,69)
*)

(* type error slice
(3,2)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,8)-(3,9)
(3,37)-(3,38)
(3,49)-(3,69)
(3,49)-(3,69)
(3,68)-(3,69)
*)

(* all spans
(2,20)-(3,69)
(3,2)-(3,69)
(3,8)-(3,9)
(3,23)-(3,25)
(3,37)-(3,38)
(3,49)-(3,69)
(3,49)-(3,64)
(3,50)-(3,61)
(3,62)-(3,63)
(3,68)-(3,69)
*)
