
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
(4,10)-(4,11)
(8,28)-(8,60)
(9,11)-(9,15)
(9,19)-(9,20)
*)

(* type error slice
(3,2)-(9,20)
(3,2)-(9,20)
(4,10)-(4,11)
(6,6)-(9,20)
(7,6)-(9,20)
(8,11)-(8,60)
(8,11)-(8,60)
(8,28)-(8,60)
*)
