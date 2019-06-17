
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else [(digitsOfInt n) mod 10];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,45)-(3,69)
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG [EmptyG]) (AppG [EmptyG,EmptyG])

*)

(* type error slice
(2,4)-(3,71)
(2,21)-(3,69)
(3,3)-(3,69)
(3,22)-(3,69)
(3,45)-(3,69)
(3,46)-(3,61)
(3,46)-(3,68)
(3,47)-(3,58)
*)
