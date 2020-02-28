
let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (0 * (mulByDigit i t));;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (mulByDigit i t);;

*)

(* changed spans
(3,47)-(3,69)
mulByDigit i t
AppG [VarG,VarG]

*)

(* type error slice
(2,4)-(3,71)
(2,20)-(3,69)
(2,22)-(3,69)
(3,3)-(3,69)
(3,24)-(3,26)
(3,37)-(3,69)
(3,45)-(3,46)
(3,47)-(3,69)
(3,52)-(3,68)
(3,53)-(3,63)
*)
