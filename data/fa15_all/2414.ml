
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
(prod / 10) :: (mulByDigit i
                           t)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG LitG]))) Nothing

(7,58)-(7,67)
mulByDigit
VarG

(7,58)-(7,67)
i
VarG

(7,58)-(7,67)
t
VarG

(7,58)-(7,67)
mulByDigit i t
AppG (fromList [VarG])

*)
