
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
(4,34)-(4,44)
(4,34)-(4,65)
(4,35)-(4,36)
(4,41)-(4,43)
(4,48)-(4,65)
(5,2)-(7,20)
(5,18)-(6,59)
(6,4)-(6,59)
(6,10)-(6,12)
(6,26)-(6,28)
(6,41)-(6,59)
(7,2)-(7,20)
*)

(* type error slice
(5,2)-(7,20)
(5,18)-(6,59)
(6,4)-(6,59)
(6,41)-(6,53)
(6,41)-(6,59)
(6,41)-(6,59)
(6,42)-(6,49)
*)
