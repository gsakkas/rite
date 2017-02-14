
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
(7,28)-(7,36)
*)

(* type error slice
(3,3)-(7,75)
(3,3)-(7,75)
(4,14)-(4,16)
(6,7)-(7,75)
(7,7)-(7,75)
(7,7)-(7,75)
(7,28)-(7,36)
(7,42)-(7,75)
*)
