
let rec digitsOfInt n = match n with | 0 -> [] | n -> [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,25)-(2,77)
(2,55)-(2,77)
(2,57)-(2,70)
(2,57)-(2,76)
(2,69)-(2,70)
*)

(* type error slice
(2,21)-(2,77)
(2,25)-(2,77)
(2,31)-(2,32)
(2,45)-(2,47)
(2,57)-(2,68)
(2,57)-(2,70)
(2,57)-(2,70)
(2,69)-(2,70)
*)
