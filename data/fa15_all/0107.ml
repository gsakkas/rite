
let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans
(4,51)-(4,66)
(@)
VarG

(4,51)-(4,76)
digitsOfInt 0 @ return
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)
