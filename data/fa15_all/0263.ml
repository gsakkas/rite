
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,69)
let myList = [] in
if n <= 0
then []
else if n < 10
     then [n]
     else digitsOfInt (n / 10) @ [n mod 10]
LetG NonRec (fromList [ListG EmptyG Nothing]) (IteG EmptyG EmptyG EmptyG)

(2,24)-(2,69)
[]
ListG EmptyG Nothing

(2,47)-(2,69)
n
VarG

(2,47)-(2,69)
n < 10
BopG VarG LitG

(2,47)-(2,69)
10
LitG

(2,47)-(2,69)
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(2,48)-(2,68)
n
VarG

(2,48)-(2,68)
(@)
VarG

(2,48)-(2,68)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

*)
