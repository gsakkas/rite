
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,26)-(3,36)
[n mod 10]
ListG [BopG EmptyG EmptyG]

(3,39)-(3,61)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(3,26)-(3,36)
(3,26)-(3,61)
(3,37)-(3,38)
*)
