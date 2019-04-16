
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in digitsOfInt n2 append [n2]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in digitsOfInt n2);;

*)

(* changed spans
(5,46)-(5,72)
digitsOfInt n2
AppG (fromList [VarG])

*)

(* type error slice
(4,4)-(5,75)
(4,21)-(5,73)
(5,3)-(5,73)
(5,26)-(5,73)
(5,46)-(5,57)
(5,46)-(5,72)
*)
