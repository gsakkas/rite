
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
(3,44)-(3,68)
(3,45)-(3,60)
(3,45)-(3,67)
(3,46)-(3,57)
(3,58)-(3,59)
*)

(* type error slice
(2,3)-(3,70)
(2,20)-(3,68)
(3,2)-(3,68)
(3,21)-(3,68)
(3,44)-(3,68)
(3,45)-(3,60)
(3,45)-(3,67)
(3,46)-(3,57)
*)
