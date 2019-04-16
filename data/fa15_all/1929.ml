
let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with
  | _ when n <= 0 -> []
  | _ when n > 0 -> (digitsOfInt r) @ digit;;


(* fix

let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with
  | _ when n <= 0 -> []
  | _ when n > 0 -> (digitsOfInt r) @ [digit];;

*)

(* changed spans
(7,39)-(7,44)
[digit]
ListG (fromList [VarG])

*)

(* type error slice
(3,3)-(7,44)
(3,15)-(3,23)
(7,21)-(7,44)
(7,37)-(7,38)
(7,39)-(7,44)
*)
