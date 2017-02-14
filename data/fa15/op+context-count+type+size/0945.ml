
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in append digitsOfInt n2 n2);;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in append (digitsOfInt n2) [n2]);;

*)

(* changed spans
(5,46)-(5,70)
(5,53)-(5,64)
(5,68)-(5,70)
*)

(* type error slice
(2,59)-(2,76)
(2,65)-(2,71)
(2,65)-(2,76)
(5,46)-(5,52)
(5,46)-(5,70)
*)
