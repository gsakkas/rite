
let rec digitsOfInt n =
  if n < 0 then [] else (match n with | h::t -> h :: (digitsOfInt t));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (n_ mod 10) :: (digitsOfInt n_));;

*)

(* changed spans
(3,5)-(3,10)
n <= 0
BopG VarG LitG

(3,24)-(3,69)
match n with
| n_ -> (n_ mod 10) :: (digitsOfInt n_)
CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG LitG]))) Nothing)])

(3,48)-(3,49)
n_ mod 10
BopG VarG LitG

(3,53)-(3,68)
n_
VarG

(3,53)-(3,68)
10
LitG

(3,66)-(3,67)
n_
VarG

*)
