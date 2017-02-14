
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then (h * i) @ (mulByDigit i t)
      else (remainder h y) @ (mulByDigit i t);;


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
(4,8)-(4,17)
(4,9)-(4,10)
(4,12)-(4,13)
(4,15)-(4,16)
(11,11)-(11,18)
(12,11)-(12,26)
(12,22)-(12,23)
(12,24)-(12,25)
*)

(* type error slice
(2,3)-(2,64)
(2,14)-(2,62)
(2,16)-(2,62)
(2,23)-(2,30)
(2,28)-(2,29)
(4,3)-(4,19)
(4,8)-(4,17)
(11,11)-(11,18)
(11,11)-(11,37)
(11,19)-(11,20)
(12,11)-(12,26)
(12,12)-(12,21)
(12,24)-(12,25)
*)
