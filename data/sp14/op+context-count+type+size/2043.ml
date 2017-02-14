
let rec digitsOfInt n = match n with | 0 -> [] | n -> [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,76)
(2,54)-(2,76)
(2,55)-(2,70)
(2,55)-(2,75)
(2,68)-(2,69)
*)

(* type error slice
(2,3)-(2,78)
(2,20)-(2,76)
(2,24)-(2,76)
(2,44)-(2,46)
(2,55)-(2,70)
(2,55)-(2,75)
(2,56)-(2,67)
*)
