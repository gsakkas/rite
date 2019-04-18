
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then ((prod mod 10) :: ((prod / 10) + (mulByDigit i t))) :: t
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
(8,12)-(8,63)
prod mod 10
BopG VarG LitG

(8,67)-(8,68)
(prod / 10) :: (mulByDigit i
                           t)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(3,3)-(9,30)
(6,18)-(6,19)
(6,18)-(6,23)
(7,7)-(9,30)
(8,12)-(8,63)
(8,12)-(8,68)
(8,30)-(8,62)
(8,67)-(8,68)
(9,12)-(9,25)
(9,12)-(9,30)
*)
