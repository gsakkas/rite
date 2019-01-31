
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
z
VarG

(5,34)-(5,44)
(@)
VarG

(5,34)-(5,44)
mulByDigit i
           [((z * i) mod 10) + x]
AppG (fromList [VarG,ListG EmptyG Nothing])

(5,47)-(5,73)
[((z * i) mod 10) + x]
ListG (BopG EmptyG EmptyG) Nothing

(5,50)-(5,51)
z
VarG

(5,67)-(5,68)
x
VarG

*)
