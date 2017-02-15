
let rec digitsOfInt n =
  let m = n in if n < 0 then [] else [digitsOfInt (n / 10); m mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,2)-(3,69)
(3,10)-(3,11)
(3,37)-(3,69)
(3,38)-(3,58)
(3,60)-(3,61)
(3,60)-(3,68)
*)

(* type error slice
(2,3)-(3,71)
(2,20)-(3,69)
(3,2)-(3,69)
(3,15)-(3,69)
(3,37)-(3,69)
(3,37)-(3,69)
(3,38)-(3,49)
(3,38)-(3,58)
*)
