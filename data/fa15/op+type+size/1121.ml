
let rec wwhile (f,b) = if f then f (f, b) else b;;


(* fix

let rec wwhile (f,b) = b;;

*)

(* changed spans
(2,23)-(2,48)
(2,26)-(2,27)
(2,33)-(2,41)
*)

(* type error slice
(2,33)-(2,34)
(2,33)-(2,41)
(2,35)-(2,41)
(2,36)-(2,37)
*)

(* all spans
(2,16)-(2,48)
(2,23)-(2,48)
(2,26)-(2,27)
(2,33)-(2,41)
(2,33)-(2,34)
(2,35)-(2,41)
(2,36)-(2,37)
(2,39)-(2,40)
(2,47)-(2,48)
*)
