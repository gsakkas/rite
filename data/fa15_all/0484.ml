
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
append (digitsOfInt n2) [n2]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,59)-(2,77)
(2,64)-(2,77)
(2,65)-(2,71)
(5,46)-(5,52)
(5,46)-(5,70)
*)
