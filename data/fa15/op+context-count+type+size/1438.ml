
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else (remainder i h) @ (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else [remainder i h] @ (mulByDigit i t);;

*)

(* changed spans
(10,13)-(10,26)
*)

(* type error slice
(2,4)-(2,65)
(2,15)-(2,63)
(2,17)-(2,63)
(2,21)-(2,63)
(2,43)-(2,56)
(10,13)-(10,22)
(10,13)-(10,26)
(10,13)-(10,45)
(10,28)-(10,29)
*)
