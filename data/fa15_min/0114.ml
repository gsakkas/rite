
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
(5,31)-(5,56)
digitsOfInt 0 @ return
AppG [AppG [EmptyG],VarG]

*)

(* type error slice
(2,4)-(6,16)
(2,21)-(6,14)
(3,3)-(6,14)
(4,3)-(6,14)
(5,31)-(5,46)
(5,31)-(5,56)
(5,32)-(5,43)
(5,50)-(5,56)
(6,8)-(6,14)
*)
