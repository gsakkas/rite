
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
(6,7)-(9,21)
(7,7)-(9,21)
(8,13)-(8,59)
(8,13)-(8,59)
(8,31)-(8,59)
(8,31)-(8,59)
(8,45)-(8,55)
(8,45)-(8,59)
*)
