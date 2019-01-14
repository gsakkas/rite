
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
(@)
VarG

(6,51)-(6,61)
mulByDigit i [x']
AppG (fromList [VarG,ListG EmptyG Nothing])

*)
