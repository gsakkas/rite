
let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with
  | _ when n <= 0 -> []
  | _ when n > 0 -> (digitsOfInt r) :: digit;;


(* fix

let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with
  | _ when n <= 0 -> []
  | _ when n > 0 -> (digitsOfInt r) @ [digit];;

*)

(* changed spans
(7,22)-(7,35)
(7,22)-(7,45)
(7,40)-(7,45)
*)

(* type error slice
(2,4)-(7,47)
(2,21)-(7,45)
(3,3)-(7,45)
(3,3)-(7,45)
(3,15)-(3,23)
(5,3)-(7,45)
(7,22)-(7,33)
(7,22)-(7,35)
(7,22)-(7,45)
(7,22)-(7,45)
(7,22)-(7,45)
(7,40)-(7,45)
*)
