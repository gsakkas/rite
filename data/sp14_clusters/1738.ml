
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let leading = (digitsOfInt (n / 10)) :: (n mod 10) in
     listReverse leading);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ [n mod 10]);;

*)

(* changed spans
(9,19)-(9,55)
let digits =
  digitsOfInt (n / 10) in
digits @ [n mod 10]
LetG NonRec [AppG [EmptyG]] (AppG [EmptyG,EmptyG])

(9,45)-(9,55)
digits
VarG

(9,45)-(9,55)
(@)
VarG

(9,45)-(9,55)
digits @ [n mod 10]
AppG [VarG,ListG EmptyG Nothing]

(9,45)-(9,55)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
