
let rec mulByDigit i l =
  match l with
  | [] -> [0]
  | x::x' -> [[(x * i) / 10]; ((x * i) mod 10) + (mulByDigit i x')];;


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
(4,10)-(4,13)
(4,11)-(4,12)
(5,13)-(5,67)
(5,14)-(5,28)
(5,30)-(5,66)
(5,49)-(5,66)
(5,50)-(5,60)
(5,63)-(5,65)
*)

(* type error slice
(2,3)-(5,69)
(2,19)-(5,67)
(2,21)-(5,67)
(3,2)-(5,67)
(3,2)-(5,67)
(4,10)-(4,13)
(4,10)-(4,13)
(4,11)-(4,12)
(5,13)-(5,67)
(5,13)-(5,67)
(5,13)-(5,67)
(5,14)-(5,28)
(5,30)-(5,66)
(5,30)-(5,66)
(5,49)-(5,66)
(5,50)-(5,60)
*)

(* all spans
(2,19)-(5,67)
(2,21)-(5,67)
(3,2)-(5,67)
(3,8)-(3,9)
(4,10)-(4,13)
(4,11)-(4,12)
(5,13)-(5,67)
(5,14)-(5,28)
(5,15)-(5,27)
(5,15)-(5,22)
(5,16)-(5,17)
(5,20)-(5,21)
(5,25)-(5,27)
(5,30)-(5,66)
(5,30)-(5,46)
(5,31)-(5,38)
(5,32)-(5,33)
(5,36)-(5,37)
(5,43)-(5,45)
(5,49)-(5,66)
(5,50)-(5,60)
(5,61)-(5,62)
(5,63)-(5,65)
*)
