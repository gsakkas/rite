
let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [digitsOfInt n10; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [n mod 10] @ (digitsOfInt n10));;

*)

(* changed spans
(3,46)-(3,73)
(3,47)-(3,58)
(3,47)-(3,62)
(3,59)-(3,62)
(3,64)-(3,72)
*)

(* type error slice
(2,3)-(3,76)
(2,20)-(3,74)
(3,2)-(3,74)
(3,25)-(3,74)
(3,46)-(3,73)
(3,46)-(3,73)
(3,47)-(3,58)
(3,47)-(3,62)
*)
