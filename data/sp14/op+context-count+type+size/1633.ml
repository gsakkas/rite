
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: ((prod / 10) + (mulByDigit i t))
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
(8,28)-(8,60)
*)

(* type error slice
(2,3)-(9,31)
(2,19)-(9,29)
(2,21)-(9,29)
(3,2)-(9,29)
(6,6)-(9,29)
(7,6)-(9,29)
(8,11)-(8,60)
(8,11)-(8,60)
(8,28)-(8,60)
(8,28)-(8,60)
(8,43)-(8,59)
(8,44)-(8,54)
*)
