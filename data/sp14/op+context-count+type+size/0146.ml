
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
(5,65)-(5,73)
*)

(* type error slice
(5,40)-(5,73)
(5,62)-(5,63)
(5,65)-(5,73)
*)
