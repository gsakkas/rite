
let rec sumList xs = let x::t = xs in if x != [] then x + (sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,39)-(2,69)
(2,42)-(2,43)
(2,42)-(2,49)
(2,47)-(2,49)
(2,60)-(2,69)
*)

(* type error slice
(2,39)-(2,69)
(2,39)-(2,69)
(2,39)-(2,69)
(2,42)-(2,43)
(2,42)-(2,49)
(2,42)-(2,49)
(2,47)-(2,49)
(2,55)-(2,56)
(2,55)-(2,69)
(2,55)-(2,69)
*)
