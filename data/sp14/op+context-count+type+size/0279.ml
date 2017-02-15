
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,39)-(5,61)
(5,39)-(5,75)
(5,65)-(5,75)
*)

(* type error slice
(2,3)-(5,78)
(2,20)-(5,76)
(3,2)-(5,76)
(5,7)-(5,76)
(5,39)-(5,61)
(5,39)-(5,75)
(5,39)-(5,75)
(5,39)-(5,75)
(5,40)-(5,51)
(5,65)-(5,75)
*)
