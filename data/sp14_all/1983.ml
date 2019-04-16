
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,64)-(5,74)
[n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(5,39)-(5,74)
(5,62)-(5,63)
(5,64)-(5,74)
*)
