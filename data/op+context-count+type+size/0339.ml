
let rec digitsOfInt n =
  if n < 0 then [] else (match n mod 10 with | _ -> [digitsOfInt (n / 10)]);;



let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;


(* changed spans
(3,25)-(3,54)
(3,74)-(3,76)
*)

(* type error slice
(3,54)-(3,73)
*)
