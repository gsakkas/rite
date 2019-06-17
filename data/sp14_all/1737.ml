
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
(8,8)-(8,71)
let digits =
  digitsOfInt (n / 10) in
digits @ [n mod 10]
LetG NonRec [(VarPatG,AppG [EmptyG])] (AppG [EmptyG,EmptyG])

*)

(* type error slice
(3,3)-(3,58)
(3,37)-(3,52)
(3,37)-(3,58)
(3,38)-(3,49)
(3,50)-(3,51)
(3,53)-(3,54)
(3,55)-(3,58)
(3,56)-(3,57)
(5,4)-(8,73)
(5,21)-(8,71)
(6,3)-(8,71)
(8,8)-(8,71)
(8,17)-(8,39)
(8,17)-(8,53)
(8,18)-(8,29)
(8,43)-(8,53)
(8,57)-(8,68)
(8,57)-(8,70)
(8,69)-(8,70)
*)
