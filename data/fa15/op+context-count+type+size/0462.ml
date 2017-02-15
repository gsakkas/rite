
let rec mulByDigit i l =
  if i <= 0
  then []
  else (match l with | [] -> [] | h::t -> [h * i] @ (mulByDigit t));;


(* fix

let rec mulByDigit i l =
  if i <= 0
  then []
  else (match l with | [] -> [] | h::t -> [h * i] @ (mulByDigit i t));;

*)

(* changed spans
(5,52)-(5,66)
(5,64)-(5,65)
*)

(* type error slice
(2,3)-(5,69)
(2,19)-(5,67)
(3,5)-(3,6)
(3,5)-(3,11)
(3,5)-(3,11)
(3,10)-(3,11)
(5,7)-(5,67)
(5,7)-(5,67)
(5,52)-(5,66)
(5,53)-(5,63)
(5,64)-(5,65)
*)
