
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
(7,38)-(7,43)
*)

(* type error slice
(3,2)-(7,43)
(3,14)-(3,22)
(7,20)-(7,43)
(7,36)-(7,37)
(7,38)-(7,43)
*)
