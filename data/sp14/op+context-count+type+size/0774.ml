
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | n -> append (helper (n / 10)) (n mod 10) in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (helper (n / 10)) @ [n mod 10] in
  helper n;;

*)

(* changed spans
(3,2)-(7,10)
(3,17)-(4,64)
(3,21)-(4,64)
(4,4)-(4,64)
(4,10)-(4,13)
(4,27)-(4,30)
(4,43)-(4,49)
(4,43)-(4,64)
(4,50)-(4,52)
(4,53)-(4,64)
(4,54)-(4,56)
(4,60)-(4,63)
(5,2)-(7,10)
(6,34)-(6,40)
(6,59)-(6,69)
(7,2)-(7,10)
*)

(* type error slice
(4,43)-(4,49)
(4,43)-(4,64)
(4,53)-(4,64)
(6,34)-(6,40)
(6,34)-(6,69)
(6,59)-(6,69)
*)
