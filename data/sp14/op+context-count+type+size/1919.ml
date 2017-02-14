
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt n)
       | true  -> (digitsOfInt n) mod 10);;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt n)
       | true  -> digitsOfInt (n mod 10));;

*)

(* changed spans
(8,18)-(8,40)
(8,31)-(8,32)
*)

(* type error slice
(6,6)-(8,41)
(6,6)-(8,41)
(7,19)-(7,39)
(7,19)-(7,39)
(7,24)-(7,39)
(7,25)-(7,36)
(8,18)-(8,33)
(8,18)-(8,40)
(8,18)-(8,40)
(8,19)-(8,30)
*)
