
let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else digitsOfInt (n / 10);;

*)

(* changed spans
(3,49)-(3,69)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(3,25)-(3,69)
(3,40)-(3,43)
(3,49)-(3,69)
*)
