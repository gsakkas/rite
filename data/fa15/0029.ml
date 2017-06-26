
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let quotient = n / 10 in
      if quotient = 0 then n mod 10 else quotient :: (digitsOfInt quotient);;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let quotient = n / 10 in
      if quotient = 0 then [n mod 10] else quotient :: (digitsOfInt quotient);;

let _ = digitsOfInt 3124;;

*)

(* changed spans
(7,27)-(7,35)
*)

(* type error slice
(7,6)-(7,75)
(7,27)-(7,35)
(7,41)-(7,75)
*)

(* all spans
(2,20)-(7,75)
(3,2)-(7,75)
(3,8)-(3,13)
(3,8)-(3,9)
(3,12)-(3,13)
(4,13)-(4,15)
(6,6)-(7,75)
(6,21)-(6,27)
(6,21)-(6,22)
(6,25)-(6,27)
(7,6)-(7,75)
(7,9)-(7,21)
(7,9)-(7,17)
(7,20)-(7,21)
(7,27)-(7,35)
(7,27)-(7,28)
(7,33)-(7,35)
(7,41)-(7,75)
(7,41)-(7,49)
(7,53)-(7,75)
(7,54)-(7,65)
(7,66)-(7,74)
*)
