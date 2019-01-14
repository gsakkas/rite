
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
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
