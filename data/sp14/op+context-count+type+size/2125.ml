
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,51)-(3,61)
*)

(* type error slice
(3,46)-(3,61)
(3,49)-(3,50)
(3,51)-(3,61)
*)
