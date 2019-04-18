
let rec digitsOfInt n = match n with | _ -> if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,45)-(2,61)
n < 0
BopG VarG LitG

*)

(* type error slice
(2,45)-(2,61)
(2,59)-(2,61)
(2,61)-(2,61)
*)
