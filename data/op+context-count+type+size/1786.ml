
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
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
(8,31)-(8,59)
(9,12)-(9,16)
(9,20)-(9,21)
*)

(* type error slice
(2,4)-(9,23)
(2,20)-(9,21)
(2,22)-(9,21)
(3,3)-(9,21)
(3,9)-(3,17)
(3,9)-(3,19)
(3,18)-(3,19)
(4,11)-(4,13)
(6,18)-(6,23)
(6,22)-(6,23)
(8,13)-(8,24)
(8,13)-(8,59)
(8,31)-(8,59)
(8,45)-(8,55)
(8,45)-(8,59)
(8,56)-(8,57)
(8,58)-(8,59)
*)
