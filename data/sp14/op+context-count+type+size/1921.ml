
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (n / 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(8,18)-(8,40)
(8,19)-(8,30)
(8,44)-(8,54)
(8,45)-(8,46)
*)

(* type error slice
(2,3)-(8,57)
(2,20)-(8,55)
(3,2)-(8,55)
(6,6)-(8,55)
(8,18)-(8,40)
(8,18)-(8,54)
(8,18)-(8,54)
(8,18)-(8,54)
(8,19)-(8,30)
(8,44)-(8,54)
*)
