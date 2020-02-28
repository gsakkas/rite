
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,52)-(3,62)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(3,47)-(3,62)
(3,50)-(3,51)
(3,52)-(3,62)
*)
