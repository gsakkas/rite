
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
(6,51)-(6,61)
(6,65)-(6,74)
*)

(* type error slice
(2,3)-(6,79)
(2,19)-(6,77)
(2,21)-(6,77)
(3,2)-(6,77)
(3,2)-(6,77)
(3,8)-(3,9)
(6,7)-(6,14)
(6,8)-(6,9)
(6,50)-(6,76)
(6,51)-(6,61)
(6,64)-(6,75)
(6,64)-(6,75)
(6,65)-(6,74)
*)
