
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

*)

(* changed spans
(7,27)-(7,35)
*)

(* type error slice
(3,2)-(7,75)
(3,2)-(7,75)
(4,13)-(4,15)
(6,6)-(7,75)
(7,6)-(7,75)
(7,6)-(7,75)
(7,27)-(7,35)
(7,41)-(7,75)
*)
