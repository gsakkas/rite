
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
mulByDigit i t
AppG (fromList [VarG])

(5,64)-(5,65)
i
VarG

*)
