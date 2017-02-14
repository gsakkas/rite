
let rec wwhile (f,b) = let (x,y) = f b in if y then (wwhile f) * x else x;;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, y) else x;;

*)

(* changed spans
(2,54)-(2,67)
(2,61)-(2,62)
(2,66)-(2,67)
*)

(* type error slice
(2,4)-(2,76)
(2,17)-(2,74)
(2,54)-(2,60)
(2,54)-(2,62)
(2,61)-(2,62)
*)
