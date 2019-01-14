
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,24)-(2,40)
if n < 10
then [n]
else digitsOfInt (n / 10)
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

*)
