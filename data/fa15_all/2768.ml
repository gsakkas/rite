
let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;


(* fix

let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] ->
              if (i * h) > 10
              then [carry i h] @ [remainder i h]
              else [remainder i h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;

*)

(* changed spans
(14,18)-(14,68)
[remainder i h]
ListG (AppG (fromList [EmptyG])) Nothing

(16,32)-(16,33)
remainder
VarG

(16,32)-(16,33)
i
VarG

(16,32)-(16,33)
h
VarG

(16,32)-(16,33)
mulByDigit i
           t' @ ([remainder h'
                            i + carry h i] @ [remainder h
                                                        i])
AppG (fromList [AppG (fromList [EmptyG])])

*)
