
let rec mulByDigit i l = match l with | [] -> [] | h::t -> h * i;;


(* fix

let rec mulByDigit i l = match l with | [] -> [] | h::m::t -> t;;

*)

(* changed spans
(2,25)-(2,64)
(2,59)-(2,60)
(2,59)-(2,64)
(2,63)-(2,64)
*)

(* type error slice
(2,25)-(2,64)
(2,25)-(2,64)
(2,46)-(2,48)
(2,59)-(2,64)
*)
