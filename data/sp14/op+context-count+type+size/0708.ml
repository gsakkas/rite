
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> helper (append [m / 10] [m mod 10]) in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

*)

(* changed spans
(6,34)-(6,40)
(6,34)-(6,69)
(6,49)-(6,57)
(6,50)-(6,56)
*)

(* type error slice
(4,4)-(4,64)
(4,4)-(4,64)
(4,27)-(4,30)
(4,43)-(4,49)
(4,43)-(4,64)
(4,53)-(4,64)
(4,60)-(4,63)
(5,2)-(7,10)
(5,17)-(6,69)
(6,4)-(6,69)
(6,4)-(6,69)
(6,10)-(6,11)
(6,34)-(6,40)
(6,34)-(6,69)
(6,41)-(6,69)
(6,42)-(6,48)
*)
