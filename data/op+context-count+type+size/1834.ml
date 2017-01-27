
let rec sumList xs = let x::t = xs in x + (if t != [] then sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,44)-(2,69)
(2,47)-(2,54)
(2,60)-(2,69)
*)

(* type error slice
(2,4)-(2,72)
(2,17)-(2,69)
(2,22)-(2,69)
(2,33)-(2,35)
(2,39)-(2,69)
(2,44)-(2,69)
(2,60)-(2,67)
(2,60)-(2,69)
(2,68)-(2,69)
*)
