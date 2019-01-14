
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
(6,16)-(6,17)
(@)
VarG

(7,15)-(7,16)
[digit]
ListG VarG Nothing

(7,20)-(7,44)
digitsOfInt r @ [digit]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

*)
