
let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [digitsOfInt n10; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [n mod 10] @ (digitsOfInt n10));;

*)

(* changed spans
(3,47)-(3,74)
(3,48)-(3,59)
(3,48)-(3,63)
(3,60)-(3,63)
(3,65)-(3,73)
*)

(* type error slice
(2,21)-(3,74)
(3,3)-(3,74)
(3,6)-(3,7)
(3,6)-(3,12)
(3,18)-(3,20)
(3,47)-(3,74)
(3,48)-(3,59)
(3,48)-(3,63)
*)
