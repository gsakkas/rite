
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
(2,39)-(2,69)
(2,44)-(2,69)
(2,44)-(2,69)
*)
