
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else [(digitsOfInt n) mod 10];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,45)-(3,69)
(3,47)-(3,58)
(3,47)-(3,60)
(3,47)-(3,68)
(3,59)-(3,60)
*)

(* type error slice
(2,4)-(3,71)
(2,21)-(3,69)
(3,3)-(3,69)
(3,22)-(3,69)
(3,25)-(3,26)
(3,25)-(3,31)
(3,30)-(3,31)
(3,37)-(3,39)
(3,47)-(3,58)
(3,47)-(3,60)
(3,59)-(3,60)
*)
