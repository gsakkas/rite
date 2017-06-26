
let rec sumList xs = let x::t = xs in if t != [] then x + (sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,38)-(2,69)
(2,41)-(2,48)
(2,54)-(2,55)
(2,54)-(2,69)
*)

(* type error slice
(2,38)-(2,69)
(2,54)-(2,69)
*)

(* all spans
(2,16)-(2,69)
(2,21)-(2,69)
(2,32)-(2,34)
(2,38)-(2,69)
(2,41)-(2,48)
(2,41)-(2,42)
(2,46)-(2,48)
(2,54)-(2,69)
(2,54)-(2,55)
(2,58)-(2,69)
(2,59)-(2,66)
(2,67)-(2,68)
*)
