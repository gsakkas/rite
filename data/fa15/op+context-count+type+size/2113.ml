
let rec mulByDigit i l =
  match l with
  | [] -> []
  | z::x::x' -> [(x * i) / 10] @ (mulByDigit i [((x * i) mod 10) + z; x']);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | z::x::x' -> [(z * i) / 10] @ ((mulByDigit i [((z * i) mod 10) + x]) @ x');;

*)

(* changed spans
(5,19)-(5,20)
(5,35)-(5,45)
(5,48)-(5,74)
(5,51)-(5,52)
(5,68)-(5,69)
*)

(* type error slice
(3,3)-(5,74)
(3,3)-(5,74)
(3,3)-(5,74)
(5,48)-(5,74)
(5,48)-(5,74)
(5,51)-(5,69)
(5,71)-(5,73)
*)
