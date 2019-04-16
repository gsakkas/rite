
let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> (listReverse t) :: h;;


(* fix

let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(3,50)-(3,70)
listReverse (append t [h])
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,10)
(3,38)-(3,39)
(3,50)-(3,70)
(3,69)-(3,70)
*)
