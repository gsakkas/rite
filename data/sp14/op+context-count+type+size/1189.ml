
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> ((n mod 10) :: (digitsOfInt (n / 10))) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,23)-(4,24)
(4,34)-(4,67)
(4,74)-(4,76)
*)

(* type error slice
(2,4)-(4,78)
(2,21)-(4,76)
(3,3)-(4,76)
(4,3)-(4,76)
(4,3)-(4,76)
(4,23)-(4,24)
(4,34)-(4,67)
(4,34)-(4,76)
(4,48)-(4,59)
(4,48)-(4,67)
*)
