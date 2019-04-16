
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
(8,29)-(8,61)
prod / 10
BopG VarG LitG

(8,65)-(8,66)
mulByDigit i t
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(9,23)
(2,20)-(9,21)
(2,22)-(9,21)
(3,3)-(9,21)
(6,7)-(9,21)
(7,7)-(9,21)
(8,29)-(8,61)
(8,44)-(8,60)
(8,45)-(8,55)
(9,12)-(9,21)
*)
