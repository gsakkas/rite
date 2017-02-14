
let rec sumList xs = let x::t = xs in x + (if t != [] then sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,43)-(2,68)
(2,46)-(2,53)
(2,59)-(2,68)
*)

(* type error slice
(2,38)-(2,69)
(2,42)-(2,69)
(2,43)-(2,68)
*)
