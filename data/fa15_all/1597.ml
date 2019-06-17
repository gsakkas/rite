
let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(2,48)-(2,68)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,25)-(2,68)
(2,40)-(2,42)
(2,48)-(2,68)
*)
