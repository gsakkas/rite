
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | n -> append helper (n / 10) [n mod 10] in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | n -> append (helper (n / 10)) [n mod 10] in
  helper n;;

*)

(* changed spans
(6,35)-(6,68)
append (helper (n / 10))
       [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(4,5)-(4,65)
(4,44)-(4,50)
(4,44)-(4,65)
(4,51)-(4,53)
(4,54)-(4,65)
(5,3)-(7,11)
(5,18)-(6,68)
(6,35)-(6,41)
(6,35)-(6,68)
(6,42)-(6,48)
(6,49)-(6,57)
(7,3)-(7,9)
(7,3)-(7,11)
*)
