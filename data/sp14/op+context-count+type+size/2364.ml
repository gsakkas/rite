
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,46)-(3,48)
(3,46)-(3,62)
(3,52)-(3,62)
*)

(* type error slice
(3,46)-(3,62)
(3,52)-(3,62)
*)
