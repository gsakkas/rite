
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
(12,16)-(12,66)
match t with
| [] -> [remainder i h]
| h' :: t' -> [h' * i] @ mulByDigit i
                                    t'
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList [EmptyG]))])

*)

(* type error slice
(4,4)-(4,65)
(4,15)-(4,63)
(4,17)-(4,63)
(4,24)-(4,31)
(4,29)-(4,30)
(6,4)-(12,69)
(6,20)-(12,67)
(6,22)-(12,67)
(7,3)-(12,67)
(10,5)-(12,67)
(12,16)-(12,66)
(12,17)-(12,33)
(12,17)-(12,47)
(12,18)-(12,28)
(12,49)-(12,50)
(12,52)-(12,61)
(12,52)-(12,65)
(12,64)-(12,65)
*)
