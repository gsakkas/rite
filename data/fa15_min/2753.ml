
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [remainder i t] @ (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [remainder i h] @ (mulByDigit i t);;

*)

(* changed spans
(7,26)-(7,27)
h
VarG

*)

(* type error slice
(2,4)-(2,65)
(2,15)-(2,63)
(2,17)-(2,63)
(2,24)-(2,31)
(2,29)-(2,30)
(5,3)-(7,47)
(7,14)-(7,23)
(7,14)-(7,27)
(7,26)-(7,27)
*)
