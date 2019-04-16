
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
(6,35)-(6,70)
append (helper (m / 10))
       [m mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(4,5)-(4,65)
(4,28)-(4,31)
(4,44)-(4,50)
(4,44)-(4,65)
(4,54)-(4,65)
(4,61)-(4,64)
(5,3)-(7,11)
(5,18)-(6,70)
(6,5)-(6,70)
(6,11)-(6,12)
(6,35)-(6,41)
(6,35)-(6,70)
(6,42)-(6,70)
(6,43)-(6,49)
*)
