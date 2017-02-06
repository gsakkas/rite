
let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let rec digitsOfInt n =
  if n > 0 then (listReverse (n mod 10)) :: (digitsOfInt (n / 10)) else [];;


(* fix

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let rec digitsOfInt n =
  if n > 0 then listReverse ((n mod 10) :: (digitsOfInt (n / 10))) else [];;

*)

(* changed spans
(8,18)-(8,65)
(8,31)-(8,39)
*)

(* type error slice
(2,4)-(5,27)
(2,21)-(5,25)
(3,3)-(5,25)
(3,3)-(5,25)
(3,29)-(4,71)
(3,33)-(4,71)
(4,5)-(4,71)
(4,5)-(4,71)
(4,5)-(4,71)
(4,5)-(4,71)
(4,5)-(4,71)
(4,5)-(4,71)
(4,5)-(4,71)
(4,11)-(4,14)
(4,28)-(4,31)
(4,42)-(4,59)
(4,42)-(4,71)
(4,42)-(4,71)
(4,42)-(4,71)
(4,60)-(4,61)
(4,63)-(4,64)
(4,63)-(4,71)
(4,68)-(4,71)
(5,3)-(5,20)
(5,3)-(5,25)
(5,3)-(5,25)
(5,3)-(5,25)
(5,21)-(5,22)
(5,23)-(5,25)
(7,4)-(8,77)
(7,21)-(8,75)
(8,3)-(8,75)
(8,3)-(8,75)
(8,6)-(8,7)
(8,6)-(8,11)
(8,6)-(8,11)
(8,6)-(8,11)
(8,10)-(8,11)
(8,18)-(8,29)
(8,18)-(8,39)
(8,18)-(8,39)
(8,18)-(8,65)
(8,31)-(8,32)
(8,31)-(8,39)
(8,37)-(8,39)
(8,46)-(8,57)
(8,46)-(8,65)
(8,73)-(8,75)
*)
