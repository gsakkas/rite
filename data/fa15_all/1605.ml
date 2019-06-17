
let rec digitsOfInt n =
  if n < 0 then [] else (match n with | h::t -> [h; digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,68)
[] @ [n mod 10]
AppG [ListG [],ListG [EmptyG]]

*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(3,25)-(3,68)
(3,32)-(3,33)
*)
