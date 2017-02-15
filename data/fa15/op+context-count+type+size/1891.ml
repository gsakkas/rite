
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
(3,2)-(5,67)
(5,13)-(5,67)
(5,14)-(5,28)
(5,30)-(5,66)
(5,49)-(5,66)
(5,50)-(5,60)
(5,50)-(5,65)
(5,61)-(5,62)
*)

(* type error slice
(5,13)-(5,67)
(5,13)-(5,67)
(5,14)-(5,28)
(5,30)-(5,66)
(5,30)-(5,66)
(5,49)-(5,66)
*)
