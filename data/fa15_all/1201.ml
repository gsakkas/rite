
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then f;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,68)-(2,69)
h
VarG

*)

(* type error slice
(2,30)-(2,31)
(2,30)-(2,33)
(2,50)-(2,69)
(2,68)-(2,69)
(2,69)-(2,69)
*)
