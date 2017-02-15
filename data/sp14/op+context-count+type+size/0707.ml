
let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (n mod 10) @ (helper (n / 10)) in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (n mod 10) :: (helper (n / 10)) in
  helper n;;

*)

(* changed spans
(4,34)-(4,64)
(4,45)-(4,46)
*)

(* type error slice
(4,34)-(4,44)
(4,34)-(4,64)
(4,45)-(4,46)
*)
