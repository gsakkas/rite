
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h else f h;;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(2,23)-(2,77)
(2,52)-(2,53)
(2,67)-(2,68)
(2,74)-(2,75)
(2,76)-(2,77)
*)

(* type error slice
(2,23)-(2,77)
(2,29)-(2,30)
(2,29)-(2,32)
(2,49)-(2,77)
(2,67)-(2,68)
(2,74)-(2,75)
(2,74)-(2,77)
*)

(* all spans
(2,16)-(2,77)
(2,23)-(2,77)
(2,29)-(2,32)
(2,29)-(2,30)
(2,31)-(2,32)
(2,49)-(2,77)
(2,52)-(2,61)
(2,52)-(2,53)
(2,56)-(2,61)
(2,67)-(2,68)
(2,74)-(2,77)
(2,74)-(2,75)
(2,76)-(2,77)
*)
