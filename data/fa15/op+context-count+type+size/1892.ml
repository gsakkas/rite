
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ ((mulByDigit i x') @ x''));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(6,65)-(6,67)
*)

(* type error slice
(2,3)-(6,78)
(2,19)-(6,76)
(2,21)-(6,76)
(3,2)-(6,76)
(3,2)-(6,76)
(3,2)-(6,76)
(3,8)-(3,9)
(6,51)-(6,68)
(6,52)-(6,62)
(6,65)-(6,67)
*)
