
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,51)-(3,61)
[n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(3,26)-(3,61)
(3,49)-(3,50)
(3,51)-(3,61)
*)
