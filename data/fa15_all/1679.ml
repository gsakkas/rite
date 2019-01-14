
let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) :: x);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,45)-(3,60)
(@)
VarG

(3,45)-(3,65)
digitsOfInt n @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,64)-(3,65)
[x]
ListG VarG Nothing

*)
