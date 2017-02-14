
let rec digitsOfInt n = if n < 0 then [] else [(digitsOfInt (n / 10)) mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,47)-(2,78)
(2,49)-(2,77)
(2,75)-(2,77)
*)

(* type error slice
(2,4)-(2,80)
(2,21)-(2,78)
(2,25)-(2,78)
(2,47)-(2,78)
(2,49)-(2,60)
(2,49)-(2,68)
(2,49)-(2,77)
*)
