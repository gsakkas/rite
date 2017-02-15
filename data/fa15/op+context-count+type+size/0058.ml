
let rec digitsOfInt n =
  let return = [] in
  if n <> 0
  then ((n mod 10) :: return; (digitsOfInt 0) :: return)
  else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <> 0 then ((n mod 10) :: return; (digitsOfInt 0) @ return) else return;;

*)

(* changed spans
(5,30)-(5,45)
(5,30)-(5,55)
*)

(* type error slice
(2,3)-(6,15)
(2,20)-(6,13)
(3,2)-(6,13)
(4,2)-(6,13)
(5,7)-(5,56)
(5,7)-(5,56)
(5,8)-(5,28)
(5,30)-(5,45)
(5,30)-(5,55)
(5,30)-(5,55)
(5,31)-(5,42)
*)
