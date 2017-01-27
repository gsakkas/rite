
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: ((prod / 10) + (mulByDigit i t))
      else prod :: t;;


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
(4,11)-(4,12)
(8,31)-(8,59)
(9,12)-(9,16)
(9,20)-(9,21)
*)

(* type error slice
(3,3)-(9,21)
(4,11)-(4,12)
(6,7)-(9,21)
(7,7)-(9,21)
(8,13)-(8,24)
(8,13)-(8,59)
(8,31)-(8,59)
*)
