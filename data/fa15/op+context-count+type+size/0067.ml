
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
(5,32)-(5,62)
(5,64)-(5,73)
(5,64)-(5,75)
(5,74)-(5,75)
*)

(* type error slice
(4,3)-(6,14)
(4,3)-(6,14)
(5,10)-(5,29)
(5,10)-(5,29)
(5,10)-(5,75)
(5,10)-(5,75)
(5,23)-(5,29)
(5,32)-(5,62)
(5,32)-(5,75)
(5,32)-(5,75)
(5,54)-(5,55)
(5,64)-(5,73)
(5,64)-(5,75)
(6,8)-(6,14)
*)
