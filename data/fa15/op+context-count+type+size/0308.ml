
let rec digitsOfInt n =
  match n < 0 with | true  -> [] | false  -> [[(digitsOfInt n) / 10]];;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,46)-(3,70)
(3,47)-(3,69)
(3,49)-(3,62)
(3,49)-(3,68)
(3,61)-(3,62)
*)

(* type error slice
(2,4)-(3,72)
(2,21)-(3,70)
(3,3)-(3,70)
(3,46)-(3,70)
(3,49)-(3,60)
(3,49)-(3,62)
(3,49)-(3,68)
*)
