
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,41)-(2,41)
if n < 10
then [n]
else digitsOfInt (n / 10)
IteG (BopG EmptyG EmptyG) (ListG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,25)-(2,41)
(2,39)-(2,41)
(2,41)-(2,41)
*)
