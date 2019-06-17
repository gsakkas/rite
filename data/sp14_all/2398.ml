
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
(n mod 10) :: (digitsOfInt (n / 10))
AppG [BopG EmptyG EmptyG,AppG [EmptyG]]

*)

(* type error slice
(6,7)-(8,52)
(7,20)-(7,47)
(7,25)-(7,47)
(7,26)-(7,37)
(8,19)-(8,51)
(8,20)-(8,31)
(8,20)-(8,40)
(8,42)-(8,50)
*)
