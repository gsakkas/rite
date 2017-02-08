
let rec listReverse l = match l with | [] -> [] | a::b::[] -> 0;;


(* fix

let rec listReverse l = match l with | [] -> [] | a::b::[] -> [a];;

*)

(* changed spans
(2,63)-(2,64)
*)

(* type error slice
(2,25)-(2,64)
(2,25)-(2,64)
(2,46)-(2,48)
(2,63)-(2,64)
*)
