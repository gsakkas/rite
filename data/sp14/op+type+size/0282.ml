
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ -> if (n / 10) != 0 then (digitsOfInt (n / 10)) @ [n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ -> if (n / 10) != 0 then (digitsOfInt (n / 10)) @ [n mod 10] else []);;

*)

(* changed spans
(8,12)-(8,69)
*)

(* type error slice
(8,12)-(8,69)
(8,12)-(8,69)
(8,12)-(8,69)
(8,34)-(8,69)
(8,57)-(8,58)
*)

(* all spans
(2,20)-(8,70)
(3,2)-(8,70)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(6,4)-(8,70)
(6,11)-(6,12)
(7,12)-(7,15)
(7,13)-(7,14)
(8,12)-(8,69)
(8,15)-(8,28)
(8,15)-(8,23)
(8,16)-(8,17)
(8,20)-(8,22)
(8,27)-(8,28)
(8,34)-(8,69)
(8,57)-(8,58)
(8,34)-(8,56)
(8,35)-(8,46)
(8,47)-(8,55)
(8,48)-(8,49)
(8,52)-(8,54)
(8,59)-(8,69)
(8,60)-(8,68)
(8,60)-(8,61)
(8,66)-(8,68)
(8,12)-(8,69)
*)