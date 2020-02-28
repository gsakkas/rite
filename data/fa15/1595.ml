
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,26)-(3,62)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(3,64)
(2,21)-(3,62)
(3,3)-(3,62)
(3,26)-(3,62)
(3,40)-(3,62)
(3,41)-(3,56)
(3,42)-(3,53)
*)
