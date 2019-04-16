
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let x l = List.map string_of_int;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match l with
     | [] -> []
     | h::t ->
         if (List.length t) > 1
         then (remainder i h) :: (mulByDigit i t)
         else [x * y]);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match l with
     | [] -> []
     | h::t ->
         if (List.length t) > 1
         then (remainder i h) :: (mulByDigit i t)
         else [i * h]);;

*)

(* changed spans
(17,16)-(17,17)
i
VarG

(17,20)-(17,21)
h
VarG

*)

(* type error slice
(4,4)-(4,35)
(4,7)-(4,33)
(6,4)-(6,20)
(6,9)-(6,18)
(17,16)-(17,17)
(17,16)-(17,21)
(17,20)-(17,21)
*)
