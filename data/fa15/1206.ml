
let rec wwhile (f,b) = match f b with | (_,t) -> if t = true then 5;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then h;;

*)

(* changed spans
(2,23)-(2,67)
(2,66)-(2,67)
*)

(* type error slice
(2,49)-(2,67)
(2,66)-(2,67)
*)

(* all spans
(2,16)-(2,67)
(2,23)-(2,67)
(2,29)-(2,32)
(2,29)-(2,30)
(2,31)-(2,32)
(2,49)-(2,67)
(2,52)-(2,60)
(2,52)-(2,53)
(2,56)-(2,60)
(2,66)-(2,67)
*)
