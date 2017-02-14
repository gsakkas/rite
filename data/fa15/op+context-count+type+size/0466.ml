
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt ((n - (n mod 10)) / 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,64)
(3,18)-(3,52)
(3,55)-(3,63)
*)

(* type error slice
(2,4)-(3,74)
(2,21)-(3,72)
(3,3)-(3,72)
(3,17)-(3,64)
(3,17)-(3,64)
(3,18)-(3,29)
(3,18)-(3,52)
*)
