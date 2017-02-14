
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then [prod mod 10; (prod / 10) + (mulByDigit i t)]
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
(8,11)-(8,56)
(8,25)-(8,55)
(9,11)-(9,15)
(9,19)-(9,20)
*)

(* type error slice
(2,3)-(9,22)
(2,19)-(9,20)
(2,21)-(9,20)
(3,2)-(9,20)
(6,6)-(9,20)
(7,6)-(9,20)
(8,11)-(8,56)
(8,25)-(8,55)
(8,39)-(8,55)
(8,40)-(8,50)
*)
