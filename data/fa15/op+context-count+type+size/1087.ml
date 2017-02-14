
let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (0 * (mulByDigit i t));;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (mulByDigit i t);;

*)

(* changed spans
(3,48)-(3,49)
(3,48)-(3,67)
*)

(* type error slice
(2,4)-(3,71)
(2,20)-(3,67)
(2,22)-(3,67)
(3,3)-(3,67)
(3,24)-(3,26)
(3,37)-(3,67)
(3,45)-(3,46)
(3,48)-(3,67)
(3,48)-(3,67)
(3,53)-(3,63)
(3,53)-(3,67)
*)
