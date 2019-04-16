
let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (n mod 10) :: (helper (n / 10)) in
  let rec reverse xs =
    match xs with | [] -> [] | hd::tl -> (reverse tl) :: hd in
  reverse (helper n);;


(* fix

let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (helper (n / 10)) @ [n mod 10] in
  helper n;;

*)

(* changed spans
(4,35)-(4,66)
helper (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

(5,3)-(7,21)
helper n
AppG (fromList [VarG])

*)

(* type error slice
(5,3)-(7,21)
(5,19)-(6,60)
(6,5)-(6,60)
(6,42)-(6,54)
(6,42)-(6,60)
(6,43)-(6,50)
*)
