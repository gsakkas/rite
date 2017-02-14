
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
(7,40)-(7,41)
*)

(* type error slice
(3,2)-(7,68)
(3,2)-(7,68)
(4,13)-(4,15)
(6,6)-(7,68)
(7,6)-(7,68)
(7,6)-(7,68)
(7,14)-(7,22)
(7,26)-(7,68)
(7,26)-(7,68)
(7,40)-(7,41)
(7,47)-(7,68)
(7,63)-(7,64)
(7,65)-(7,68)
(7,65)-(7,68)
(7,66)-(7,67)
*)
