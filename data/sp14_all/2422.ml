
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: ((prod / 10) + [mulByDigit i t])
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
(8,29)-(8,61)
(prod / 10) :: (mulByDigit i
                           t)
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(8,12)-(8,61)
(8,29)-(8,61)
(8,44)-(8,60)
*)
