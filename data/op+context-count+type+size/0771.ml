
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
(4,36)-(4,63)
(4,46)-(4,47)
*)

(* type error slice
(4,36)-(4,44)
(4,36)-(4,63)
(4,46)-(4,47)
*)
