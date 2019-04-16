
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then h;;

*)

(* changed spans
(2,67)-(2,70)
h
VarG

*)

(* type error slice
(2,24)-(2,70)
(2,30)-(2,31)
(2,30)-(2,33)
(2,50)-(2,70)
(2,67)-(2,68)
(2,67)-(2,70)
(2,70)-(2,70)
*)
