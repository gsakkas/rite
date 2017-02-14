
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in digitsOfInt n2 append [n2]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in digitsOfInt n2);;

*)

(* changed spans
(2,15)-(2,76)
(2,18)-(2,76)
(2,23)-(2,76)
(2,29)-(2,31)
(2,45)-(2,47)
(2,58)-(2,59)
(2,58)-(2,76)
(2,63)-(2,76)
(2,64)-(2,70)
(2,71)-(2,72)
(2,73)-(2,75)
(5,17)-(5,19)
(5,25)-(5,72)
*)

(* type error slice
(4,3)-(5,74)
(4,20)-(5,72)
(5,2)-(5,72)
(5,25)-(5,72)
(5,45)-(5,56)
(5,45)-(5,71)
*)
