
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
          | h'::t' -> (h' * i) @ (mulByDigit i t')));;


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
(13,23)-(13,31)
[h' * i]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(13,23)-(13,31)
(13,23)-(13,51)
(13,32)-(13,33)
*)
