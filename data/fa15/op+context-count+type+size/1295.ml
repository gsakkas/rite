
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
(10,11)-(10,26)
*)

(* type error slice
(2,3)-(2,64)
(2,14)-(2,62)
(2,16)-(2,62)
(2,20)-(2,62)
(2,41)-(2,55)
(10,11)-(10,26)
(10,11)-(10,45)
(10,12)-(10,21)
(10,27)-(10,28)
*)
