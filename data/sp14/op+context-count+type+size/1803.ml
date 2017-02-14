
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10 then (prod mod 10) :: (prod / 10) else prod :: t;;


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
(7,41)-(7,52)
(7,58)-(7,62)
(7,58)-(7,67)
(7,66)-(7,67)
*)

(* type error slice
(7,24)-(7,52)
(7,41)-(7,52)
*)
