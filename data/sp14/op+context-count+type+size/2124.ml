
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [digitsOfInt (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,52)-(3,63)
(3,52)-(3,74)
*)

(* type error slice
(2,3)-(3,78)
(2,20)-(3,76)
(3,2)-(3,76)
(3,25)-(3,76)
(3,46)-(3,75)
(3,49)-(3,50)
(3,51)-(3,75)
(3,51)-(3,75)
(3,52)-(3,63)
(3,52)-(3,74)
*)
