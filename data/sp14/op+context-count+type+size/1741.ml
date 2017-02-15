
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
(8,18)-(8,50)
(8,19)-(8,39)
(8,41)-(8,42)
(8,41)-(8,49)
(8,47)-(8,49)
*)

(* type error slice
(6,6)-(8,51)
(6,6)-(8,51)
(7,19)-(7,46)
(7,19)-(7,46)
(7,24)-(7,46)
(7,25)-(7,36)
(8,18)-(8,50)
(8,18)-(8,50)
(8,18)-(8,50)
(8,19)-(8,30)
(8,19)-(8,39)
(8,41)-(8,49)
*)
