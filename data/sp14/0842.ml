
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
(8,16)-(8,66)
(8,29)-(8,39)
*)

(* type error slice
(2,3)-(5,26)
(2,20)-(5,24)
(4,4)-(4,71)
(4,41)-(4,58)
(4,41)-(4,71)
(4,59)-(4,60)
(5,2)-(5,19)
(5,2)-(5,24)
(5,20)-(5,21)
(8,16)-(8,40)
(8,17)-(8,28)
(8,29)-(8,39)
*)

(* all spans
(2,20)-(5,24)
(3,2)-(5,24)
(3,28)-(4,71)
(3,32)-(4,71)
(4,4)-(4,71)
(4,10)-(4,13)
(4,27)-(4,30)
(4,41)-(4,71)
(4,41)-(4,58)
(4,59)-(4,60)
(4,61)-(4,71)
(4,62)-(4,63)
(4,67)-(4,70)
(5,2)-(5,24)
(5,2)-(5,19)
(5,20)-(5,21)
(5,22)-(5,24)
(7,20)-(8,74)
(8,2)-(8,74)
(8,5)-(8,10)
(8,5)-(8,6)
(8,9)-(8,10)
(8,16)-(8,66)
(8,16)-(8,40)
(8,17)-(8,28)
(8,29)-(8,39)
(8,30)-(8,31)
(8,36)-(8,38)
(8,44)-(8,66)
(8,45)-(8,56)
(8,57)-(8,65)
(8,58)-(8,59)
(8,62)-(8,64)
(8,72)-(8,74)
*)
