
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then [prod mod 10; (prod / 10) :: (mulByDigit i t)]
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
(8,11)-(8,57)
(9,11)-(9,15)
(9,19)-(9,20)
*)

(* type error slice
(8,11)-(8,57)
(8,11)-(8,57)
(8,12)-(8,23)
(8,25)-(8,56)
*)
