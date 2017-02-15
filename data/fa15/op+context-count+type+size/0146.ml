
let rec digitsOfInt n =
  if n < 0 then [] else [((digitsOfInt n) / 10) :: (n mod 10)];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,62)
(3,25)-(3,47)
(3,25)-(3,61)
(3,26)-(3,41)
(3,39)-(3,40)
(3,51)-(3,61)
*)

(* type error slice
(2,3)-(3,64)
(2,20)-(3,62)
(3,2)-(3,62)
(3,24)-(3,62)
(3,25)-(3,47)
(3,25)-(3,61)
(3,26)-(3,41)
(3,27)-(3,38)
(3,51)-(3,61)
*)
