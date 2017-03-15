
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in append digitsOfInt n2 n2);;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in append (digitsOfInt n2) [n2]);;

*)

(* changed spans
(5,45)-(5,69)
(5,52)-(5,63)
(5,67)-(5,69)
*)

(* type error slice
(2,58)-(2,76)
(2,63)-(2,76)
(2,64)-(2,70)
(5,45)-(5,51)
(5,45)-(5,69)
*)

(* all spans
(2,15)-(2,76)
(2,18)-(2,76)
(2,23)-(2,76)
(2,29)-(2,31)
(2,45)-(2,47)
(2,58)-(2,76)
(2,58)-(2,59)
(2,63)-(2,76)
(2,64)-(2,70)
(2,71)-(2,72)
(2,73)-(2,75)
(4,20)-(5,70)
(5,2)-(5,70)
(5,5)-(5,11)
(5,5)-(5,6)
(5,10)-(5,11)
(5,17)-(5,19)
(5,25)-(5,70)
(5,35)-(5,41)
(5,35)-(5,36)
(5,39)-(5,41)
(5,45)-(5,69)
(5,45)-(5,51)
(5,52)-(5,63)
(5,64)-(5,66)
(5,67)-(5,69)
*)
