
let rec listReverse l = match l with | [] -> [] | a::b -> [listReverse b; a];;


(* fix

let rec listReverse l = match l with | [] -> [] | b::[] -> [b];;

*)

(* changed spans
(2,24)-(2,76)
(2,58)-(2,76)
(2,59)-(2,70)
(2,59)-(2,72)
(2,74)-(2,75)
*)

(* type error slice
(2,3)-(2,78)
(2,20)-(2,76)
(2,24)-(2,76)
(2,58)-(2,76)
(2,58)-(2,76)
(2,59)-(2,70)
(2,59)-(2,72)
*)
