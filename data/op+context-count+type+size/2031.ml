
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,34)-(3,53)
(3,60)-(3,61)
(3,60)-(3,68)
(3,66)-(3,68)
*)

(* type error slice
(2,4)-(3,71)
(2,21)-(3,68)
(3,3)-(3,68)
(3,23)-(3,25)
(3,34)-(3,45)
(3,34)-(3,53)
(3,34)-(3,68)
(3,47)-(3,48)
(3,47)-(3,53)
(3,60)-(3,68)
*)
