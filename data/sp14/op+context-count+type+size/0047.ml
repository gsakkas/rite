
let rec mulByDigit i l = match l with | [] -> [] | h::t -> h * i;;


(* fix

let rec mulByDigit i l = match l with | [] -> [] | h::m::t -> t;;

*)

(* changed spans
(2,26)-(2,65)
(2,60)-(2,61)
(2,60)-(2,65)
(2,64)-(2,65)
*)

(* type error slice
(2,26)-(2,65)
(2,26)-(2,65)
(2,47)-(2,49)
(2,60)-(2,65)
*)
