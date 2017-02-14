
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: [prod / 10] :: (mulByDigit i t)
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
(8,28)-(8,39)
*)

(* type error slice
(8,11)-(8,24)
(8,11)-(8,59)
(8,11)-(8,59)
(8,28)-(8,39)
(8,28)-(8,59)
(8,28)-(8,59)
*)
