
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | [] -> [] | h::t -> h @ [digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (match n with | 0 -> []);;

*)

(* changed spans
(5,9)-(5,62)
(5,43)-(5,62)
*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,6)-(3,11)
(3,10)-(3,11)
(5,9)-(5,62)
(5,9)-(5,62)
(5,9)-(5,62)
(5,9)-(5,62)
(5,15)-(5,16)
*)
