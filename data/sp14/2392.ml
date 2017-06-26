
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
(7,19)-(7,39)
(7,24)-(7,39)
(7,25)-(7,36)
(8,18)-(8,33)
(8,18)-(8,40)
(8,19)-(8,30)
*)

(* all spans
(2,20)-(8,41)
(3,2)-(8,41)
(3,8)-(3,13)
(3,8)-(3,9)
(3,12)-(3,13)
(4,14)-(4,16)
(6,6)-(8,41)
(6,13)-(6,18)
(6,13)-(6,14)
(6,17)-(6,18)
(7,19)-(7,39)
(7,19)-(7,20)
(7,24)-(7,39)
(7,25)-(7,36)
(7,37)-(7,38)
(8,18)-(8,40)
(8,18)-(8,33)
(8,19)-(8,30)
(8,31)-(8,32)
(8,38)-(8,40)
*)
