
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
(3,3)-(7,11)
(3,18)-(4,64)
(3,22)-(4,64)
(4,5)-(4,64)
(4,11)-(4,14)
(4,28)-(4,31)
(4,44)-(4,50)
(4,44)-(4,64)
(4,51)-(4,53)
(4,55)-(4,57)
(4,55)-(4,64)
(4,61)-(4,64)
(5,3)-(7,11)
(6,35)-(6,41)
(6,61)-(6,69)
(7,3)-(7,11)
*)

(* type error slice
(4,44)-(4,50)
(4,44)-(4,64)
(4,55)-(4,64)
(6,35)-(6,41)
(6,35)-(6,69)
(6,61)-(6,69)
*)
