
let rec digitsOfInt n = [digitsOfInt n; n mod 10];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 10] else [];;

*)

(* changed spans
(2,25)-(2,50)
if n > 0
then [n mod 10]
else []
IteG (BopG EmptyG EmptyG) (ListG (fromList [EmptyG])) (ListG (fromList []))

*)

(* type error slice
(2,4)-(2,52)
(2,21)-(2,50)
(2,25)-(2,50)
(2,26)-(2,37)
(2,26)-(2,39)
*)
