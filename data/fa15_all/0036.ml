
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let remainder = n mod 10 in
      if n = 0 then [remainder] else ((digitsOfInt n) / 10) @ [remainder];;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let remainder = n mod 10 in
      if n = 0 then [remainder] else (digitsOfInt (n / 10)) @ [remainder];;

*)

(* changed spans
(7,38)-(7,60)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(7,76)
(2,21)-(7,74)
(3,3)-(7,74)
(6,7)-(7,74)
(7,7)-(7,74)
(7,38)-(7,60)
(7,38)-(7,74)
(7,39)-(7,54)
(7,40)-(7,51)
(7,61)-(7,62)
*)
