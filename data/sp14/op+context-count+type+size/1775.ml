
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in digit @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,35)
(3,25)-(3,60)
(3,26)-(3,27)
(3,32)-(3,34)
(3,36)-(3,37)
(3,38)-(3,60)
*)

(* type error slice
(3,25)-(3,35)
(3,25)-(3,60)
(3,36)-(3,37)
*)
