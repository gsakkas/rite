
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n = if n <= 0 then [n] else append digitsOfInt (n / 10);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(4,56)-(4,67)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(4,68)-(4,76)
[n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,22)-(2,72)
(2,43)-(2,44)
(2,55)-(2,72)
(2,60)-(2,72)
(2,61)-(2,67)
(2,68)-(2,69)
(2,70)-(2,71)
(4,4)-(4,78)
(4,21)-(4,76)
(4,49)-(4,55)
(4,49)-(4,76)
(4,56)-(4,67)
(4,68)-(4,76)
*)
