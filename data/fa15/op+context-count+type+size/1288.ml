
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
