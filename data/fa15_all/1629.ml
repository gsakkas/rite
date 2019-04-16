
let rec digitsOfInt n =
  if n <= 0 then [] else [digitsOfInt (n / 10)] @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,26)-(3,48)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,26)-(3,48)
(3,26)-(3,61)
(3,27)-(3,38)
(3,27)-(3,47)
(3,49)-(3,50)
*)
