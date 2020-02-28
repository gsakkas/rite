
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h else h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,57)-(2,61)
false
LitG

(2,67)-(2,70)
h
VarG

(2,76)-(2,77)
()
ConAppG Nothing

*)

(* type error slice
(2,24)-(2,77)
(2,30)-(2,31)
(2,30)-(2,33)
(2,50)-(2,77)
(2,67)-(2,68)
(2,67)-(2,70)
(2,76)-(2,77)
*)
