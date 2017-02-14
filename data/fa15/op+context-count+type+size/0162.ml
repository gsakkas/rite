
let rec digitsOfInt n =
  if n < 0 then [] else [] @ (([n mod 10] digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,32)-(3,56)
(3,32)-(3,62)
(3,43)-(3,54)
(3,55)-(3,56)
(3,60)-(3,62)
*)

(* type error slice
(3,25)-(3,62)
(3,28)-(3,29)
(3,32)-(3,42)
(3,32)-(3,56)
(3,32)-(3,62)
*)
