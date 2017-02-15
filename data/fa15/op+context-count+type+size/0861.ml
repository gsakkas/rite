
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
