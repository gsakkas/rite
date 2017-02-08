
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
(8,20)-(8,41)
(8,32)-(8,33)
*)

(* type error slice
(6,8)-(8,41)
(6,8)-(8,41)
(7,20)-(7,39)
(7,20)-(7,39)
(7,26)-(7,37)
(7,26)-(7,39)
(8,20)-(8,31)
(8,20)-(8,33)
(8,20)-(8,41)
(8,20)-(8,41)
*)
