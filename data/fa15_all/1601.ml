
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) mod 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) @ [n mod 10];;

*)

(* changed spans
(3,26)-(3,50)
digitsOfInt n
AppG [VarG]

*)

(* type error slice
(2,4)-(3,65)
(2,21)-(3,63)
(3,3)-(3,63)
(3,26)-(3,50)
(3,26)-(3,63)
(3,27)-(3,42)
(3,28)-(3,39)
(3,51)-(3,52)
*)
