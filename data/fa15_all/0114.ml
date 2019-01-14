
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
(@)
VarG

(5,30)-(5,55)
digitsOfInt 0 @ return
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)
