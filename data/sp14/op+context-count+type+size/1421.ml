
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10; [digitsOfInt (n / 10)]];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,25)-(3,59)
(3,36)-(3,58)
*)

(* type error slice
(3,25)-(3,59)
(3,25)-(3,59)
(3,26)-(3,34)
(3,36)-(3,58)
*)
