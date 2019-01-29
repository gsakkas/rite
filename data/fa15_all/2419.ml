
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
(4,10)-(4,11)
[]
ListG EmptyG Nothing

(8,28)-(8,60)
(prod / 10) :: (mulByDigit i
                           t)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG LitG]))) Nothing

(9,11)-(9,15)
prod mod 10
BopG VarG LitG

(9,19)-(9,20)
10
LitG

*)
