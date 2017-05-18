
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> 1 :: 2);;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> (n mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(8,18)-(8,19)
(8,23)-(8,24)
*)

(* type error slice
(8,18)-(8,24)
(8,23)-(8,24)
*)

(* all spans
(2,20)-(8,25)
(3,2)-(8,25)
(3,8)-(3,13)
(3,8)-(3,9)
(3,12)-(3,13)
(4,14)-(4,16)
(6,6)-(8,25)
(6,13)-(6,18)
(6,13)-(6,14)
(6,17)-(6,18)
(7,19)-(7,46)
(7,19)-(7,20)
(7,24)-(7,46)
(7,25)-(7,36)
(7,37)-(7,45)
(7,38)-(7,39)
(7,42)-(7,44)
(8,18)-(8,24)
(8,18)-(8,19)
(8,23)-(8,24)
*)
