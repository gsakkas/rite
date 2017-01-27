
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
(7,43)-(7,52)
(7,59)-(7,63)
(7,59)-(7,68)
(7,67)-(7,68)
*)

(* type error slice
(7,26)-(7,37)
(7,26)-(7,52)
(7,43)-(7,52)
*)
