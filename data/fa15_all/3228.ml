
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
(6,51)-(6,77)
mulByDigit i [x'] @ x''
AppG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(2,4)-(6,80)
(2,20)-(6,78)
(2,22)-(6,78)
(3,3)-(6,78)
(3,9)-(3,10)
(6,8)-(6,15)
(6,9)-(6,10)
(6,51)-(6,77)
(6,52)-(6,62)
(6,65)-(6,76)
(6,66)-(6,75)
*)
