
let rec digitsOfInt n =
  if n < 0 then [] else [] @ (([n mod 10] digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,30)-(3,63)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(3,25)-(3,63)
(3,28)-(3,29)
(3,30)-(3,63)
(3,31)-(3,57)
(3,32)-(3,42)
*)
