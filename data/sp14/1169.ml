
let rec listReverse l = match l with | [] -> [] | a::b -> listReverse [a] b;;


(* fix

let rec listReverse l = match l with | [] -> [] | a::b -> listReverse [a];;

*)

(* changed spans
(2,58)-(2,75)
(2,74)-(2,75)
*)

(* type error slice
(2,3)-(2,77)
(2,20)-(2,75)
(2,24)-(2,75)
(2,58)-(2,69)
(2,58)-(2,75)
*)

(* all spans
(2,20)-(2,75)
(2,24)-(2,75)
(2,30)-(2,31)
(2,45)-(2,47)
(2,58)-(2,75)
(2,58)-(2,69)
(2,70)-(2,73)
(2,71)-(2,72)
(2,74)-(2,75)
*)
