
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
(7,25)-(7,26)
*)

(* type error slice
(2,3)-(2,64)
(2,14)-(2,62)
(2,16)-(2,62)
(2,23)-(2,30)
(2,28)-(2,29)
(5,2)-(7,46)
(5,2)-(7,46)
(7,13)-(7,22)
(7,13)-(7,26)
(7,25)-(7,26)
*)

(* all spans
(2,14)-(2,62)
(2,16)-(2,62)
(2,20)-(2,62)
(2,23)-(2,35)
(2,23)-(2,30)
(2,24)-(2,25)
(2,28)-(2,29)
(2,33)-(2,35)
(2,41)-(2,55)
(2,41)-(2,48)
(2,42)-(2,43)
(2,46)-(2,47)
(2,53)-(2,55)
(2,61)-(2,62)
(4,19)-(7,46)
(4,21)-(7,46)
(5,2)-(7,46)
(5,8)-(5,18)
(5,8)-(5,16)
(5,17)-(5,18)
(6,10)-(6,12)
(7,12)-(7,46)
(7,28)-(7,29)
(7,12)-(7,27)
(7,13)-(7,26)
(7,13)-(7,22)
(7,23)-(7,24)
(7,25)-(7,26)
(7,30)-(7,46)
(7,31)-(7,41)
(7,42)-(7,43)
(7,44)-(7,45)
*)
