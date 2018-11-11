
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let l = (digitsOfInt (n / 10)) :: (n mod 10) in listReverse l);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ [n mod 10]);;

*)

(* changed spans
(8,16)-(8,52)
let digits =
  digitsOfInt (n / 10) in
digits @ [n mod 10]
LetG NonRec [AppG [EmptyG]] (AppG [EmptyG,EmptyG])

(8,42)-(8,52)
digits
VarG

(8,42)-(8,52)
(@)
VarG

(8,42)-(8,52)
digits @ [n mod 10]
AppG [VarG,ListG EmptyG Nothing]

(8,42)-(8,52)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
