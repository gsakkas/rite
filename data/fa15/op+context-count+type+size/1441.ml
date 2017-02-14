
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match i with
  | i -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else (remainder i h) :: (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match i with
  | i -> []
  | _ ->
      (match l with
       | [] -> []
       | h::t ->
           if (List.length t) = 0
           then [h * i] @ (mulByDigit i t)
           else (remainder i h) :: (mulByDigit i t));;

*)

(* changed spans
(5,2)-(10,46)
(8,6)-(10,46)
*)

(* type error slice
(5,2)-(10,46)
(5,2)-(10,46)
(5,8)-(5,9)
(9,12)-(9,17)
(9,16)-(9,17)
*)
