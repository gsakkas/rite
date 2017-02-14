
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
(7,40)-(7,59)
(7,52)-(7,53)
*)

(* type error slice
(2,4)-(7,76)
(2,21)-(7,74)
(3,3)-(7,74)
(6,7)-(7,74)
(7,7)-(7,74)
(7,21)-(7,32)
(7,40)-(7,51)
(7,40)-(7,53)
(7,40)-(7,59)
(7,40)-(7,59)
(7,40)-(7,74)
(7,61)-(7,62)
*)
