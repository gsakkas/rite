
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h else f t;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,75)-(2,78)
()
ConAppG Nothing

*)

(* type error slice
(2,24)-(2,78)
(2,30)-(2,31)
(2,30)-(2,33)
(2,50)-(2,78)
(2,68)-(2,69)
(2,75)-(2,76)
(2,75)-(2,78)
*)
