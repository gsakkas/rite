
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> [digitsOfInt (n / 10); n mod 10]);;


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
(8,19)-(8,51)
(8,20)-(8,39)
(8,42)-(8,43)
(8,42)-(8,50)
(8,48)-(8,50)
*)

(* type error slice
(6,8)-(8,51)
(7,20)-(7,45)
(7,26)-(7,37)
(7,26)-(7,45)
(7,39)-(7,45)
(8,19)-(8,51)
(8,20)-(8,31)
(8,20)-(8,39)
(8,33)-(8,39)
(8,42)-(8,50)
*)
