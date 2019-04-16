
let rec digitsOfInt n = (n mod 10) @ [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(2,25)-(2,60)
if n <= 0
then []
else [n mod 10] @ digitsOfInt (n / 10)
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,25)-(2,35)
(2,25)-(2,60)
(2,36)-(2,37)
*)
