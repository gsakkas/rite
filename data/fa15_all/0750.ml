
let rec digitsOfInt n =
  match n with | 0 -> [] | x::xs' -> ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,3)-(3,73)
if n > 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(3,75)
(2,21)-(3,73)
(3,3)-(3,73)
(3,9)-(3,10)
(3,23)-(3,25)
(3,38)-(3,60)
(3,38)-(3,73)
(3,39)-(3,54)
(3,40)-(3,51)
(3,61)-(3,62)
(3,64)-(3,65)
(3,64)-(3,72)
*)
