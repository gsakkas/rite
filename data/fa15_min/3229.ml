
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ [x'']));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(7,59)-(7,64)
x''
VarG

*)

(* type error slice
(3,3)-(7,66)
(6,7)-(6,21)
(6,7)-(7,66)
(6,8)-(6,20)
(6,22)-(6,23)
(7,9)-(7,66)
(7,10)-(7,33)
(7,11)-(7,32)
(7,34)-(7,35)
(7,36)-(7,65)
(7,57)-(7,58)
(7,59)-(7,64)
(7,60)-(7,63)
*)
