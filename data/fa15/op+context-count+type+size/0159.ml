
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | [] -> [] | h::t -> [h; digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(5,7)-(5,61)
(5,14)-(5,15)
(5,29)-(5,31)
(5,42)-(5,60)
(5,43)-(5,44)
(5,46)-(5,57)
(5,46)-(5,59)
(5,58)-(5,59)
*)

(* type error slice
(3,5)-(3,6)
(3,5)-(3,10)
(3,5)-(3,10)
(3,9)-(3,10)
(5,7)-(5,61)
(5,7)-(5,61)
(5,7)-(5,61)
(5,7)-(5,61)
(5,14)-(5,15)
*)
