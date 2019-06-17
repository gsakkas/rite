
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
[]
ListG []

(8,29)-(8,61)
(prod / 10) :: (mulByDigit i
                           t)
AppG [BopG EmptyG EmptyG,AppG [EmptyG,EmptyG]]

(9,12)-(9,16)
prod mod 10
BopG VarG LitG

*)

(* type error slice
(3,3)-(9,21)
(4,11)-(4,12)
(6,7)-(9,21)
(7,7)-(9,21)
(8,12)-(8,61)
(8,29)-(8,61)
(9,12)-(9,21)
*)
