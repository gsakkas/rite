
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10 then (prod mod 10) :: (prod / 10) else prod :: t;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: (prod / 10) :: (mulByDigit i t)
      else prod :: t;;

*)

(* changed spans
(7,41)-(7,52)
(7,58)-(7,67)
*)

(* type error slice
(7,24)-(7,52)
(7,41)-(7,52)
*)

(* all spans
(2,19)-(7,67)
(2,21)-(7,67)
(3,2)-(7,67)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(6,6)-(7,67)
(6,17)-(6,22)
(6,17)-(6,18)
(6,21)-(6,22)
(7,6)-(7,67)
(7,9)-(7,18)
(7,9)-(7,13)
(7,16)-(7,18)
(7,24)-(7,52)
(7,24)-(7,37)
(7,25)-(7,29)
(7,34)-(7,36)
(7,41)-(7,52)
(7,42)-(7,46)
(7,49)-(7,51)
(7,58)-(7,67)
(7,58)-(7,62)
(7,66)-(7,67)
*)
