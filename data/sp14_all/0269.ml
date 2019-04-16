
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: [] :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,26)-(3,68)
[n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(3,26)-(3,36)
(3,26)-(3,68)
(3,40)-(3,42)
(3,40)-(3,68)
*)
