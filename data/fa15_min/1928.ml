
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
(5,56)-(5,78)
digitsOfInt r @ [digit]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(5,80)
(2,21)-(5,78)
(3,3)-(5,78)
(5,3)-(5,78)
(5,56)-(5,78)
(5,57)-(5,68)
(5,57)-(5,70)
*)
