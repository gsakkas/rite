
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else [(digitsOfInt n) mod 10];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,44)-(3,68)
n
VarG

(3,44)-(3,68)
n < 10
BopG VarG LitG

(3,44)-(3,68)
10
LitG

(3,44)-(3,68)
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(3,45)-(3,60)
(@)
VarG

(3,45)-(3,60)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,45)-(3,67)
n
VarG

(3,58)-(3,59)
n / 10
BopG VarG LitG

*)
