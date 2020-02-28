
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
(7,42)-(7,53)
(prod / 10) :: (mulByDigit i
                           t)
AppG [BopG EmptyG EmptyG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(7,25)-(7,53)
(7,42)-(7,53)
*)
