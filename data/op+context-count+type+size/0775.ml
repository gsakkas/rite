
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
(4,36)-(4,37)
(4,36)-(4,44)
(4,36)-(4,64)
(4,42)-(4,44)
(4,50)-(4,64)
(5,3)-(7,20)
(5,19)-(6,60)
(6,5)-(6,60)
(6,11)-(6,13)
(6,27)-(6,29)
(6,43)-(6,60)
(7,3)-(7,20)
*)

(* type error slice
(5,3)-(7,20)
(5,19)-(6,60)
(6,5)-(6,60)
(6,43)-(6,50)
(6,43)-(6,53)
(6,43)-(6,60)
(6,43)-(6,60)
*)
