
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
(5,18)-(5,19)
(5,34)-(5,44)
(5,47)-(5,73)
(5,50)-(5,51)
(5,67)-(5,68)
*)

(* type error slice
(3,2)-(5,74)
(3,2)-(5,74)
(3,2)-(5,74)
(5,47)-(5,73)
(5,47)-(5,73)
(5,48)-(5,68)
(5,70)-(5,72)
*)
