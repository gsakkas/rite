
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
(6,66)-(6,68)
*)

(* type error slice
(2,4)-(6,79)
(2,20)-(6,75)
(2,22)-(6,75)
(3,3)-(6,75)
(3,3)-(6,75)
(3,3)-(6,75)
(3,9)-(3,10)
(6,53)-(6,63)
(6,53)-(6,68)
(6,66)-(6,68)
*)
