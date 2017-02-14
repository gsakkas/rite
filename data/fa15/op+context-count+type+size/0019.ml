
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | [] -> [] | h::t -> h @ [digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (match n with | 0 -> []);;

*)

(* changed spans
(5,7)-(5,62)
(5,42)-(5,61)
*)

(* type error slice
(3,5)-(3,6)
(3,5)-(3,10)
(3,5)-(3,10)
(3,9)-(3,10)
(5,7)-(5,62)
(5,7)-(5,62)
(5,7)-(5,62)
(5,7)-(5,62)
(5,14)-(5,15)
*)
