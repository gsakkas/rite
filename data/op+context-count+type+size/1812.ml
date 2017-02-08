
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
(8,14)-(8,60)
(8,32)-(8,60)
(8,67)-(8,68)
*)

(* type error slice
(3,3)-(9,30)
(3,3)-(9,30)
(6,18)-(6,19)
(6,18)-(6,23)
(7,7)-(9,30)
(7,7)-(9,30)
(8,14)-(8,60)
(8,14)-(8,60)
(8,14)-(8,68)
(8,14)-(8,68)
(8,14)-(8,68)
(8,32)-(8,60)
(8,67)-(8,68)
(9,13)-(9,24)
(9,13)-(9,30)
(9,13)-(9,30)
*)
