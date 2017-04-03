
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: ((prod / 10) + (mulByDigit i t)) :: t
      else prod :: t;;


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
(8,28)-(8,60)
(8,64)-(8,65)
*)

(* type error slice
(2,3)-(9,22)
(2,19)-(9,20)
(2,21)-(9,20)
(3,2)-(9,20)
(6,6)-(9,20)
(7,6)-(9,20)
(8,11)-(8,65)
(8,28)-(8,60)
(8,43)-(8,59)
(8,44)-(8,54)
*)

(* all spans
(2,19)-(9,20)
(2,21)-(9,20)
(3,2)-(9,20)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(6,6)-(9,20)
(6,17)-(6,22)
(6,17)-(6,18)
(6,21)-(6,22)
(7,6)-(9,20)
(7,9)-(7,18)
(7,9)-(7,13)
(7,16)-(7,18)
(8,11)-(8,65)
(8,11)-(8,24)
(8,12)-(8,16)
(8,21)-(8,23)
(8,28)-(8,65)
(8,28)-(8,60)
(8,29)-(8,40)
(8,30)-(8,34)
(8,37)-(8,39)
(8,43)-(8,59)
(8,44)-(8,54)
(8,55)-(8,56)
(8,57)-(8,58)
(8,64)-(8,65)
(9,11)-(9,20)
(9,11)-(9,15)
(9,19)-(9,20)
*)
