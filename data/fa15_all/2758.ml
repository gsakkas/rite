
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then h * i
      else (remainder h y) @ (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else [remainder i h] @ (mulByDigit i t);;

*)

(* changed spans
(11,11)-(11,16)
(@)
VarG

(11,11)-(11,16)
[h * i] @ mulByDigit i t
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(11,11)-(11,16)
[h * i]
ListG (BopG EmptyG EmptyG) Nothing

(12,11)-(12,26)
[remainder i h]
ListG (AppG (fromList [EmptyG])) Nothing

(12,22)-(12,23)
i
VarG

(12,27)-(12,28)
mulByDigit
VarG

(12,27)-(12,28)
i
VarG

(12,27)-(12,28)
t
VarG

(12,27)-(12,28)
[remainder i h] @ mulByDigit i
                             t
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

*)