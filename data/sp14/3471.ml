
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (List.rev digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (List.rev (digitsOfInt (n / 10)));;

*)

(* changed spans
(3,39)-(3,70)
(3,49)-(3,60)
*)

(* type error slice
(3,39)-(3,70)
(3,40)-(3,48)
*)

(* all spans
(2,20)-(3,70)
(3,2)-(3,70)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,70)
(3,25)-(3,35)
(3,26)-(3,27)
(3,32)-(3,34)
(3,39)-(3,70)
(3,40)-(3,48)
(3,49)-(3,60)
(3,61)-(3,69)
(3,62)-(3,63)
(3,66)-(3,68)
*)
