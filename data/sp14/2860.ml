
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then [0]
    else if (List.length ((digitsOfInt (n / 10)) @ [n mod 10])) = 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(7,9)-(7,12)
(7,10)-(7,11)
(8,9)-(8,75)
(8,12)-(8,63)
(8,12)-(8,67)
(8,13)-(8,24)
(8,66)-(8,67)
(8,73)-(8,75)
*)

(* type error slice
(8,9)-(8,75)
(8,9)-(8,75)
(8,9)-(8,75)
(8,73)-(8,75)
*)

(* all spans
(2,20)-(8,75)
(3,2)-(8,75)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(6,4)-(8,75)
(6,7)-(6,12)
(6,7)-(6,8)
(6,11)-(6,12)
(7,9)-(7,12)
(7,10)-(7,11)
(8,9)-(8,75)
(8,12)-(8,67)
(8,12)-(8,63)
(8,13)-(8,24)
(8,25)-(8,62)
(8,49)-(8,50)
(8,26)-(8,48)
(8,27)-(8,38)
(8,39)-(8,47)
(8,40)-(8,41)
(8,44)-(8,46)
(8,51)-(8,61)
(8,52)-(8,60)
(8,52)-(8,53)
(8,58)-(8,60)
(8,66)-(8,67)
(8,73)-(8,75)
(8,9)-(8,75)
*)
