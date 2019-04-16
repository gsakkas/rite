
let rec digitsOfInt n = ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,25)-(2,60)
if n > 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,25)-(2,47)
(2,25)-(2,60)
(2,48)-(2,49)
*)
