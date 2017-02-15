
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
(13,34)-(13,47)
(13,34)-(13,51)
*)

(* type error slice
(2,3)-(2,64)
(2,14)-(2,62)
(2,16)-(2,62)
(13,34)-(13,47)
(13,34)-(13,51)
(13,35)-(13,44)
*)
