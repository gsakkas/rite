
let rec digitsOfInt n = if n < 0 then [] else [(digitsOfInt (n / 10)) mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,47)-(2,78)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,80)
(2,21)-(2,78)
(2,25)-(2,78)
(2,47)-(2,78)
(2,48)-(2,70)
(2,48)-(2,77)
(2,49)-(2,60)
*)
