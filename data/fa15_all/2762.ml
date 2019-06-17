
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else [remainder i h] :: (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else (remainder i h) :: (mulByDigit i t);;

*)

(* changed spans
(10,12)-(10,27)
remainder i h
AppG [VarG,VarG]

*)

(* type error slice
(9,12)-(9,19)
(9,12)-(9,38)
(9,13)-(9,18)
(9,20)-(9,21)
(9,22)-(9,38)
(9,23)-(9,33)
(10,12)-(10,27)
(10,12)-(10,47)
(10,31)-(10,47)
(10,32)-(10,42)
*)
