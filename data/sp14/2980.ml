
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec digitsOfInt n =
  if n >= 10 then (n / (help n 1)) :: (digitsOfInt (n / 10)) else [n];;


(* fix

let rec helpFac a b = if (10 * a) > b then a else helpFac (10 * a) b;;

let rec digitsOfInt n =
  if n >= 10 then (n / (helpFac n 1)) :: (digitsOfInt (n / 10)) else [n];;

*)

(* changed spans
(5,24)-(5,34)
helpFac n 1
AppG [VarG,LitG]

*)

(* type error slice
(2,32)-(2,60)
(2,45)-(2,60)
(2,46)-(2,50)
(5,24)-(5,34)
(5,25)-(5,29)
*)
