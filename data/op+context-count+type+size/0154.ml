
let rec digitsOfInt n = if n < 0 then [] else [digitsOfInt (n / 10)];;



let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;


(* changed spans
*)

(* type error slice
(2,48)-(2,67)
*)
