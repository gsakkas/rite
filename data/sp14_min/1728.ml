
let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [digitsOfInt n10; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [n mod 10] @ (digitsOfInt n10));;

*)

(* changed spans
(3,47)-(3,74)
[n mod 10] @ digitsOfInt n10
AppG [ListG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(2,4)-(3,77)
(2,21)-(3,75)
(3,3)-(3,75)
(3,26)-(3,75)
(3,47)-(3,74)
(3,48)-(3,59)
(3,48)-(3,63)
*)
