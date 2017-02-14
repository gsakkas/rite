
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | h::t -> h + (digitsOfInt t));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,27)-(3,68)
(3,33)-(3,34)
(3,50)-(3,51)
(3,50)-(3,68)
(3,55)-(3,68)
(3,67)-(3,68)
*)

(* type error slice
(3,3)-(3,68)
(3,3)-(3,68)
(3,6)-(3,7)
(3,6)-(3,12)
(3,6)-(3,12)
(3,11)-(3,12)
(3,18)-(3,20)
(3,27)-(3,68)
(3,27)-(3,68)
(3,27)-(3,68)
(3,33)-(3,34)
(3,50)-(3,68)
*)
