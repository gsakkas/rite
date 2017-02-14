
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) mod 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) @ [n mod 10];;

*)

(* changed spans
(3,28)-(3,49)
(3,47)-(3,49)
*)

(* type error slice
(2,4)-(3,65)
(2,21)-(3,63)
(3,3)-(3,63)
(3,18)-(3,20)
(3,28)-(3,39)
(3,28)-(3,41)
(3,28)-(3,49)
(3,28)-(3,49)
(3,28)-(3,63)
(3,51)-(3,52)
*)
