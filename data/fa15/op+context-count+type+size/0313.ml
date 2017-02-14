
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
(7,37)-(7,59)
(7,51)-(7,52)
*)

(* type error slice
(2,3)-(7,75)
(2,20)-(7,73)
(3,2)-(7,73)
(6,6)-(7,73)
(7,6)-(7,73)
(7,20)-(7,31)
(7,37)-(7,59)
(7,37)-(7,59)
(7,37)-(7,73)
(7,38)-(7,53)
(7,39)-(7,50)
(7,60)-(7,61)
*)
