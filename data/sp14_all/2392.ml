
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
(8,19)-(8,41)
digitsOfInt (n mod 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(6,7)-(8,42)
(7,20)-(7,40)
(7,25)-(7,40)
(7,26)-(7,37)
(8,19)-(8,34)
(8,19)-(8,41)
(8,20)-(8,31)
*)
