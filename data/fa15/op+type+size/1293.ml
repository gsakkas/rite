
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
(4,8)-(4,17)
(4,9)-(4,10)
(4,12)-(4,13)
(4,15)-(4,16)
(11,11)-(11,16)
(12,11)-(12,26)
(12,22)-(12,23)
(12,24)-(12,25)
(12,27)-(12,28)
(12,30)-(12,40)
(12,41)-(12,42)
(12,43)-(12,44)
*)

(* type error slice
(2,3)-(2,64)
(2,14)-(2,62)
(2,16)-(2,62)
(2,23)-(2,30)
(2,28)-(2,29)
(4,3)-(4,19)
(4,8)-(4,17)
(7,2)-(12,45)
(7,2)-(12,45)
(8,10)-(8,12)
(10,6)-(12,45)
(10,6)-(12,45)
(11,11)-(11,16)
(12,11)-(12,26)
(12,11)-(12,45)
(12,12)-(12,21)
(12,24)-(12,25)
(12,27)-(12,28)
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
(4,8)-(4,17)
(4,9)-(4,10)
(4,12)-(4,13)
(4,15)-(4,16)
(6,19)-(12,45)
(6,21)-(12,45)
(7,2)-(12,45)
(7,8)-(7,18)
(7,8)-(7,16)
(7,17)-(7,18)
(8,10)-(8,12)
(10,6)-(12,45)
(10,9)-(10,28)
(10,9)-(10,24)
(10,10)-(10,21)
(10,22)-(10,23)
(10,27)-(10,28)
(11,11)-(11,16)
(11,11)-(11,12)
(11,15)-(11,16)
(12,11)-(12,45)
(12,27)-(12,28)
(12,11)-(12,26)
(12,12)-(12,21)
(12,22)-(12,23)
(12,24)-(12,25)
(12,29)-(12,45)
(12,30)-(12,40)
(12,41)-(12,42)
(12,43)-(12,44)
*)
