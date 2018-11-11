
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
(5,47)-(5,58)
let c = [a ; b] in c
LetG NonRec [ListG EmptyG Nothing] VarG

(5,59)-(5,60)
[a ; b]
ListG VarG Nothing

*)
