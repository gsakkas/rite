
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then t;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,68)-(2,69)
h
VarG

*)

(* type error slice
(2,50)-(2,69)
(2,53)-(2,54)
(2,53)-(2,62)
(2,57)-(2,62)
(2,68)-(2,69)
(2,69)-(2,69)
*)
