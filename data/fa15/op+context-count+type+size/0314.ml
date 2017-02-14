
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let q = n / 10 in
      let r = n mod 10 in if q = 0 then r else (digitsOfInt q) @ [r];;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let q = n / 10 in
      let r = n mod 10 in if q = 0 then [r] else (digitsOfInt q) @ [r];;

*)

(* changed spans
(7,41)-(7,42)
*)

(* type error slice
(3,3)-(7,69)
(3,3)-(7,69)
(4,14)-(4,16)
(6,7)-(7,69)
(7,7)-(7,69)
(7,7)-(7,69)
(7,15)-(7,23)
(7,27)-(7,69)
(7,27)-(7,69)
(7,41)-(7,42)
(7,49)-(7,69)
(7,64)-(7,65)
(7,66)-(7,69)
(7,66)-(7,69)
(7,67)-(7,68)
*)
