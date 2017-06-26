
let rec listReverse l = match l with | [] -> [] | h::t -> 0;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> [];;

*)

(* changed spans
(2,58)-(2,59)
*)

(* type error slice
(2,24)-(2,59)
(2,45)-(2,47)
(2,58)-(2,59)
*)

(* all spans
(2,20)-(2,59)
(2,24)-(2,59)
(2,30)-(2,31)
(2,45)-(2,47)
(2,58)-(2,59)
*)
