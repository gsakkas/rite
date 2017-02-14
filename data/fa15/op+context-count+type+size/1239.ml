
let rec wwhile (f,b) = if f then f (f, b) else b;;


(* fix

let rec wwhile (f,b) = b;;

*)

(* changed spans
(2,24)-(2,49)
(2,27)-(2,28)
(2,34)-(2,41)
*)

(* type error slice
(2,34)-(2,35)
(2,34)-(2,41)
(2,37)-(2,38)
(2,37)-(2,41)
*)
