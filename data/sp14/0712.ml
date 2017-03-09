
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

(* all spans
(2,20)-(5,10)
(3,2)-(5,10)
(3,17)-(4,64)
(4,4)-(4,64)
(4,10)-(4,11)
(4,24)-(4,26)
(4,34)-(4,64)
(4,45)-(4,46)
(4,34)-(4,44)
(4,35)-(4,36)
(4,41)-(4,43)
(4,47)-(4,64)
(4,48)-(4,54)
(4,55)-(4,63)
(4,56)-(4,57)
(4,60)-(4,62)
(5,2)-(5,10)
(5,2)-(5,8)
(5,9)-(5,10)
*)
