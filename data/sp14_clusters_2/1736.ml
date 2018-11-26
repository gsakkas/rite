
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,61)
let digits =
  digitsOfInt (n / 10) in
digits @ [n mod 10]
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(3,51)-(3,61)
digits
VarG

(3,51)-(3,61)
(@)
VarG

(3,51)-(3,61)
digits @ [n mod 10]
AppG (fromList [VarG,ListG EmptyG Nothing])

(3,51)-(3,61)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
