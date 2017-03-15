
let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with | _ when n <= 0 -> [] | _ when n > 0 -> [digitsOfInt r; digit];;


(* fix

let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with
  | _ when n <= 0 -> []
  | _ when n > 0 -> (digitsOfInt r) @ [digit];;

*)

(* changed spans
(5,55)-(5,77)
(5,56)-(5,69)
(5,71)-(5,76)
*)

(* type error slice
(2,3)-(5,79)
(2,20)-(5,77)
(3,2)-(5,77)
(5,2)-(5,77)
(5,55)-(5,77)
(5,55)-(5,77)
(5,56)-(5,67)
(5,56)-(5,69)
*)

(* all spans
(2,20)-(5,77)
(3,2)-(5,77)
(3,14)-(3,22)
(3,14)-(3,15)
(3,20)-(3,22)
(4,10)-(4,16)
(4,10)-(4,11)
(4,14)-(4,16)
(5,2)-(5,77)
(5,8)-(5,9)
(5,34)-(5,36)
(5,55)-(5,77)
(5,56)-(5,69)
(5,56)-(5,67)
(5,68)-(5,69)
(5,71)-(5,76)
*)
