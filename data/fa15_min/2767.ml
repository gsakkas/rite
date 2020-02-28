
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
          | h'::t' -> [h' * i] @ [(remainder h) * i]));;


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
          | h'::t' -> [h' * i] @ [remainder h i]));;

*)

(* changed spans
(13,35)-(13,52)
remainder h i
AppG [VarG,VarG]

*)

(* type error slice
(2,4)-(2,65)
(2,15)-(2,63)
(2,17)-(2,63)
(13,35)-(13,48)
(13,35)-(13,52)
(13,36)-(13,45)
*)
