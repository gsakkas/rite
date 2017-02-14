
let rec digitsOfInt n =
  let m = n in if n < 0 then [] else [(digitsOfInt m) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,3)-(3,70)
(3,11)-(3,12)
(3,38)-(3,70)
(3,40)-(3,53)
(3,40)-(3,59)
(3,52)-(3,53)
(3,57)-(3,59)
(3,61)-(3,69)
*)

(* type error slice
(2,4)-(3,72)
(2,21)-(3,70)
(3,3)-(3,70)
(3,16)-(3,70)
(3,38)-(3,70)
(3,40)-(3,51)
(3,40)-(3,53)
(3,40)-(3,59)
*)
