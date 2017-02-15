
let rec digitsOfInt n =
  match n < 0 with | true  -> [] | false  -> [[digitsOfInt (n / 10)]];;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,45)-(3,69)
(3,46)-(3,68)
(3,47)-(3,67)
*)

(* type error slice
(2,3)-(3,71)
(2,20)-(3,69)
(3,2)-(3,69)
(3,45)-(3,69)
(3,45)-(3,69)
(3,46)-(3,68)
(3,46)-(3,68)
(3,47)-(3,58)
(3,47)-(3,67)
*)
