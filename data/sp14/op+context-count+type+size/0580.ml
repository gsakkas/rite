
let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,50)-(3,72)
(3,64)-(3,65)
*)

(* type error slice
(2,3)-(3,74)
(2,20)-(3,72)
(3,2)-(3,72)
(3,25)-(3,72)
(3,25)-(3,72)
(3,50)-(3,72)
(3,50)-(3,72)
(3,51)-(3,66)
(3,52)-(3,63)
*)
