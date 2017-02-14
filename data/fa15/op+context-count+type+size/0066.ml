
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
(5,32)-(5,45)
(5,32)-(5,56)
*)

(* type error slice
(2,4)-(6,16)
(2,21)-(6,14)
(3,3)-(6,14)
(4,3)-(6,14)
(5,10)-(5,29)
(5,10)-(5,56)
(5,10)-(5,56)
(5,32)-(5,43)
(5,32)-(5,45)
(5,32)-(5,56)
(5,32)-(5,56)
*)
