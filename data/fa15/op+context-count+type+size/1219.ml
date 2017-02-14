
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
(7,20)-(7,35)
(7,20)-(7,44)
(7,39)-(7,44)
*)

(* type error slice
(2,3)-(7,46)
(2,20)-(7,44)
(3,2)-(7,44)
(3,2)-(7,44)
(3,14)-(3,22)
(5,2)-(7,44)
(7,20)-(7,35)
(7,20)-(7,44)
(7,20)-(7,44)
(7,20)-(7,44)
(7,21)-(7,32)
(7,39)-(7,44)
*)
