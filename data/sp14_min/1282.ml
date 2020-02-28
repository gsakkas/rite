
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,47)-(3,63)
[] @ [n mod 10]
AppG [ListG [],ListG [EmptyG]]

*)

(* type error slice
(3,47)-(3,63)
(3,53)-(3,63)
*)
