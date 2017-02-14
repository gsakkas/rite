
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then ((prod mod 10) :: ((prod / 10) + (mulByDigit i t))) :: t
      else (prod mod 10) :: t;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: (prod / 10) :: (mulByDigit i t)
      else (prod mod 10) :: t;;

*)

(* changed spans
(8,11)-(8,62)
(8,29)-(8,61)
(8,66)-(8,67)
*)

(* type error slice
(3,2)-(9,29)
(3,2)-(9,29)
(6,17)-(6,18)
(6,17)-(6,22)
(7,6)-(9,29)
(7,6)-(9,29)
(8,11)-(8,62)
(8,11)-(8,62)
(8,11)-(8,67)
(8,11)-(8,67)
(8,11)-(8,67)
(8,29)-(8,61)
(8,66)-(8,67)
(9,11)-(9,24)
(9,11)-(9,29)
(9,11)-(9,29)
*)
