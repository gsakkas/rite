
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | [] -> [] | h::t -> [h; digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(5,9)-(5,61)
(5,15)-(5,16)
(5,30)-(5,32)
(5,43)-(5,61)
(5,44)-(5,45)
(5,47)-(5,58)
(5,47)-(5,60)
(5,59)-(5,60)
*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,6)-(3,11)
(3,10)-(3,11)
(5,9)-(5,61)
(5,9)-(5,61)
(5,9)-(5,61)
(5,9)-(5,61)
(5,15)-(5,16)
*)
