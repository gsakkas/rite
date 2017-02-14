
let rec append l r = match l with | [] -> [r] | h::t -> h :: (append t r);;

let rec digitsOfInt n = if n <= 0 then [n] else append digitsOfInt (n / 10);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(2,43)-(2,46)
(4,56)-(4,67)
*)

(* type error slice
(2,22)-(2,73)
(2,22)-(2,73)
(2,63)-(2,69)
(2,63)-(2,73)
(2,70)-(2,71)
(4,4)-(4,78)
(4,21)-(4,75)
(4,49)-(4,55)
(4,49)-(4,75)
(4,56)-(4,67)
*)
