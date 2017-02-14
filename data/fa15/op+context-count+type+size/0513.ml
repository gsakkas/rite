
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
(5,54)-(5,66)
(5,65)-(5,66)
*)

(* type error slice
(2,4)-(5,70)
(2,20)-(5,66)
(3,6)-(3,7)
(3,6)-(3,12)
(3,6)-(3,12)
(3,11)-(3,12)
(5,9)-(5,66)
(5,9)-(5,66)
(5,54)-(5,64)
(5,54)-(5,66)
(5,65)-(5,66)
*)
