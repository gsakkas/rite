
let rec listReverse l = match l with | [] -> [] | h::t -> t @ h;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> t @ [h];;

*)

(* changed spans
(2,62)-(2,63)
*)

(* type error slice
(2,24)-(2,63)
(2,58)-(2,59)
(2,58)-(2,63)
(2,60)-(2,61)
(2,62)-(2,63)
*)

(* all spans
(2,20)-(2,63)
(2,24)-(2,63)
(2,30)-(2,31)
(2,45)-(2,47)
(2,58)-(2,63)
(2,60)-(2,61)
(2,58)-(2,59)
(2,62)-(2,63)
*)
