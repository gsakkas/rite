
let rec digitsOfInt n =
  let m = n in if n < 0 then [] else [[digitsOfInt (m / 10)]; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,3)-(3,72)
if n < 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(3,74)
(2,21)-(3,72)
(3,3)-(3,72)
(3,16)-(3,72)
(3,38)-(3,72)
(3,39)-(3,61)
(3,40)-(3,51)
(3,40)-(3,60)
(3,63)-(3,71)
*)
