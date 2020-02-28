
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
(9,5)-(10,26)
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
(5,4)-(10,28)
(5,21)-(10,26)
(6,3)-(10,26)
(9,5)-(10,26)
(9,20)-(9,42)
(9,20)-(9,56)
(9,21)-(9,32)
(9,46)-(9,56)
(10,6)-(10,17)
(10,6)-(10,25)
(10,18)-(10,25)
*)
