
let rec digitsOfInt n =
  if n < 0 then [] else (match n mod 10 with | _ -> [digitsOfInt (n / 10)]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(3,25)-(3,76)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(3,78)
(2,21)-(3,76)
(3,3)-(3,76)
(3,25)-(3,76)
(3,53)-(3,75)
(3,54)-(3,65)
(3,54)-(3,74)
*)
