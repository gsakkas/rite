
let rec mulByDigit i l = match l with | [] -> [] | h::t -> h * i;;



let rec mulByDigit i l = match l with | [] -> [] | h::m::t -> t;;


(* changed spans
(2,60)-(2,65)
*)

(* type error slice
(2,26)-(2,65)
*)
