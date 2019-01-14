
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else [digitsOfInt (n mod 10); digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(4,38)-(4,48)
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(4,39)-(4,40)
n < 10
BopG VarG LitG

(4,50)-(4,70)
n
VarG

(4,50)-(4,70)
(@)
VarG

(4,50)-(4,70)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(4,50)-(4,70)
[n]
ListG VarG Nothing

*)
