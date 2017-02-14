
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
(10,11)-(10,26)
*)

(* type error slice
(9,11)-(9,18)
(9,11)-(9,18)
(9,11)-(9,37)
(9,12)-(9,17)
(9,19)-(9,20)
(9,21)-(9,37)
(9,22)-(9,32)
(10,11)-(10,26)
(10,11)-(10,46)
(10,11)-(10,46)
(10,30)-(10,46)
(10,31)-(10,41)
*)
