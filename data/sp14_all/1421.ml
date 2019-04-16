
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,65)-(5,75)
[n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(5,40)-(5,75)
(5,63)-(5,64)
(5,65)-(5,75)
*)
