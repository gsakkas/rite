
let rec digitsOfInt n = match n with | [] -> [] | _ -> if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,24)-(2,71)
(2,55)-(2,71)
*)

(* type error slice
(2,24)-(2,71)
(2,24)-(2,71)
(2,30)-(2,31)
(2,55)-(2,71)
(2,55)-(2,71)
(2,55)-(2,71)
(2,58)-(2,59)
(2,58)-(2,63)
(2,58)-(2,63)
(2,62)-(2,63)
(2,69)-(2,71)
*)
