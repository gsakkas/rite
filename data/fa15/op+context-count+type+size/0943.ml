
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in digitsOfInt n2 append [n2]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in digitsOfInt n2);;

*)

(* changed spans
(2,16)-(2,76)
(2,19)-(2,76)
(2,24)-(2,76)
(2,30)-(2,32)
(2,46)-(2,48)
(2,59)-(2,60)
(2,59)-(2,76)
(2,65)-(2,71)
(2,65)-(2,76)
(2,72)-(2,73)
(2,74)-(2,76)
(5,18)-(5,20)
(5,27)-(5,72)
*)

(* type error slice
(4,4)-(5,75)
(4,21)-(5,72)
(5,3)-(5,72)
(5,27)-(5,72)
(5,46)-(5,57)
(5,46)-(5,72)
*)
