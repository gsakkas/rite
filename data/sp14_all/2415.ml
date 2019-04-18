
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
(8,12)-(8,58)
(prod mod 10) :: ((prod / 10) :: (mulByDigit i
                                             t))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(9,12)-(9,16)
prod mod 10
BopG VarG LitG

*)

(* type error slice
(8,12)-(8,58)
(8,13)-(8,24)
(8,26)-(8,57)
*)
