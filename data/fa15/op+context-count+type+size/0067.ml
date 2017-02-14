
let rec digitsOfInt n =
  let return = [] in
  if n <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return; print_int n)
  else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <> 0
  then ((n mod 10) :: return; print_int n; (digitsOfInt (n / 10)) @ return)
  else return;;

*)

(* changed spans
(5,30)-(5,61)
(5,63)-(5,72)
(5,63)-(5,74)
(5,73)-(5,74)
*)

(* type error slice
(4,2)-(6,13)
(4,2)-(6,13)
(5,7)-(5,75)
(5,7)-(5,75)
(5,8)-(5,28)
(5,8)-(5,28)
(5,22)-(5,28)
(5,30)-(5,61)
(5,30)-(5,74)
(5,30)-(5,74)
(5,53)-(5,54)
(5,63)-(5,72)
(5,63)-(5,74)
(6,7)-(6,13)
*)
