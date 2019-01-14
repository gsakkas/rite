
let rec digitsOfInt n =
  if n > 0 then let x = n mod 10 in (digitsOfInt n) :: x else [];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,5)-(3,10)
n < 0
BopG VarG LitG

(3,16)-(3,56)
[]
ListG EmptyG Nothing

(3,36)-(3,51)
(@)
VarG

(3,36)-(3,56)
digitsOfInt n @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,55)-(3,56)
[x]
ListG VarG Nothing

*)
