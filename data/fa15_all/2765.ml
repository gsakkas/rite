
let carry x y = (x * y) / 10;;

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t -> [(mulByDigit i t) + (carry h i)] @ [remainder i t]);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> [remainder i h]
          | h'::t' -> [h' * i] @ (mulByDigit i t')));;

*)

(* changed spans
(12,15)-(12,47)
t
VarG

(12,17)-(12,27)
remainder
VarG

(12,44)-(12,45)
[h' * i] @ mulByDigit i t'
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(12,48)-(12,49)
match t with
| [] -> [remainder i h]
| h' :: t' -> [h' * i] @ mulByDigit i
                                    t'
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(12,50)-(12,65)
(@)
VarG

(12,51)-(12,60)
mulByDigit
VarG

(12,51)-(12,64)
h'
VarG

(12,51)-(12,64)
i
VarG

(12,51)-(12,64)
h' * i
BopG VarG VarG

(12,63)-(12,64)
t'
VarG

*)
