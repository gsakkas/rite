
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i [x' :: x'']));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(6,52)-(6,62)
(6,66)-(6,75)
*)

(* type error slice
(2,4)-(6,80)
(2,20)-(6,76)
(2,22)-(6,76)
(3,3)-(6,76)
(3,3)-(6,76)
(3,9)-(3,10)
(6,9)-(6,10)
(6,9)-(6,14)
(6,52)-(6,62)
(6,52)-(6,76)
(6,65)-(6,76)
(6,65)-(6,76)
(6,66)-(6,75)
*)
