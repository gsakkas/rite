
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then t;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,67)-(2,68)
h
VarG

*)
