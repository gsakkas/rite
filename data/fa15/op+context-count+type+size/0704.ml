
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,25)-(3,61)
(3,39)-(3,61)
*)

(* type error slice
(2,3)-(3,63)
(2,20)-(3,61)
(3,2)-(3,61)
(3,25)-(3,61)
(3,25)-(3,61)
(3,39)-(3,61)
(3,39)-(3,61)
(3,40)-(3,55)
(3,41)-(3,52)
*)

(* all spans
(2,20)-(3,61)
(3,2)-(3,61)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,61)
(3,25)-(3,35)
(3,26)-(3,34)
(3,26)-(3,27)
(3,32)-(3,34)
(3,39)-(3,61)
(3,40)-(3,55)
(3,41)-(3,52)
(3,53)-(3,54)
(3,58)-(3,60)
*)
