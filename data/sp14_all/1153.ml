
let rec digitsOfInt n =
  if n < 0
  then []
  else (let a = n / 10 in let b = n mod 10 in (digitsOfInt a) :: b);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (let a = n / 10 in let b = n mod 10 in let c = [a; b] in c);;

*)

(* changed spans
(5,47)-(5,67)
let c = [a ; b] in c
LetG NonRec (fromList [(VarPatG,ListG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(2,4)-(5,70)
(2,21)-(5,68)
(3,3)-(5,68)
(5,8)-(5,68)
(5,27)-(5,67)
(5,35)-(5,43)
(5,47)-(5,62)
(5,47)-(5,67)
(5,48)-(5,59)
(5,66)-(5,67)
*)
