
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: ((prod / 10) + (mulByDigit i t))
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
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(9,32)
(2,20)-(9,30)
(2,22)-(9,30)
(3,3)-(9,30)
(6,7)-(9,30)
(7,7)-(9,30)
(8,12)-(8,61)
(8,29)-(8,61)
(8,44)-(8,60)
(8,45)-(8,55)
(9,12)-(9,30)
*)
