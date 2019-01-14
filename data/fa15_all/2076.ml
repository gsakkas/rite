
let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) :: x else n;;


(* fix

let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else [n];;

*)

(* changed spans
(3,36)-(3,58)
(@)
VarG

(3,36)-(3,63)
digitsOfInt (n / 10) @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,62)-(3,63)
[x]
ListG VarG Nothing

(3,69)-(3,70)
[n]
ListG VarG Nothing

*)
