
let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> (listHelper t h) :: l2 in
  listHelper l [];;


(* fix

let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> listHelper t (h :: l2) in
  listHelper l [];;

*)

(* changed spans
(4,38)-(4,60)
(4,52)-(4,53)
*)

(* type error slice
(3,2)-(5,17)
(3,21)-(4,60)
(3,23)-(4,60)
(4,4)-(4,60)
(4,25)-(4,27)
(4,38)-(4,54)
(4,38)-(4,60)
(4,39)-(4,49)
(4,58)-(4,60)
*)

(* all spans
(2,20)-(5,17)
(3,2)-(5,17)
(3,21)-(4,60)
(3,23)-(4,60)
(4,4)-(4,60)
(4,10)-(4,11)
(4,25)-(4,27)
(4,38)-(4,60)
(4,38)-(4,54)
(4,39)-(4,49)
(4,50)-(4,51)
(4,52)-(4,53)
(4,58)-(4,60)
(5,2)-(5,17)
(5,2)-(5,12)
(5,13)-(5,14)
(5,15)-(5,17)
*)
