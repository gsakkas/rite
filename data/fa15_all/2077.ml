
let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else n;;


(* fix

let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else [n];;

*)

(* changed spans
(3,70)-(3,71)
[n]
ListG VarG Nothing

*)
