
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x' -> [[(x * i) / 10]; ((x * i) mod 10) + [mulByDigit i x']];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,3)-(5,68)
(5,14)-(5,68)
(5,15)-(5,29)
(5,33)-(5,67)
(5,50)-(5,67)
(5,51)-(5,61)
(5,51)-(5,66)
(5,62)-(5,63)
*)

(* type error slice
(5,14)-(5,68)
(5,14)-(5,68)
(5,15)-(5,29)
(5,33)-(5,67)
(5,33)-(5,67)
(5,50)-(5,67)
*)
