
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then h * i
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
(4,9)-(4,18)
(4,10)-(4,11)
(4,13)-(4,14)
(4,16)-(4,17)
(11,12)-(11,17)
(12,13)-(12,26)
(12,23)-(12,24)
(12,25)-(12,26)
(12,28)-(12,29)
(12,31)-(12,41)
(12,42)-(12,43)
(12,44)-(12,45)
*)

(* type error slice
(2,4)-(2,65)
(2,15)-(2,63)
(2,17)-(2,63)
(2,25)-(2,30)
(2,29)-(2,30)
(4,4)-(4,20)
(4,9)-(4,18)
(7,3)-(12,45)
(7,3)-(12,45)
(8,11)-(8,13)
(10,7)-(12,45)
(10,7)-(12,45)
(11,12)-(11,17)
(12,13)-(12,22)
(12,13)-(12,26)
(12,13)-(12,45)
(12,25)-(12,26)
(12,28)-(12,29)
*)
