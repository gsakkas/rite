
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
(5,29)-(5,30)
(@)
VarG

(5,50)-(5,51)
[digit]
ListG VarG Nothing

(5,55)-(5,77)
digitsOfInt r @ [digit]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

*)
