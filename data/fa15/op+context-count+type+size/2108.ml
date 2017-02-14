
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x' -> [(x * i) / 10] @ [((x * i) mod 10) + (mulByDigit i x')];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,3)-(5,69)
(5,31)-(5,69)
(5,52)-(5,62)
(5,52)-(5,67)
(5,63)-(5,64)
*)

(* type error slice
(2,4)-(5,71)
(2,20)-(5,69)
(2,22)-(5,69)
(3,3)-(5,69)
(5,14)-(5,69)
(5,29)-(5,30)
(5,34)-(5,67)
(5,52)-(5,62)
(5,52)-(5,67)
*)
