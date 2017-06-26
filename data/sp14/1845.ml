
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs2 with | [] -> xs1 | hd::tl -> append (xs1 :: hd) tl in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

*)

(* changed spans
(4,10)-(4,13)
(4,43)-(4,49)
(4,43)-(4,64)
(4,51)-(4,54)
(4,62)-(4,64)
(5,2)-(7,10)
*)

(* type error slice
(3,2)-(7,10)
(3,17)-(4,64)
(4,4)-(4,64)
(4,43)-(4,49)
(4,43)-(4,64)
(4,50)-(4,61)
(4,51)-(4,54)
(4,58)-(4,60)
(4,62)-(4,64)
(6,34)-(6,40)
(6,34)-(6,69)
(6,59)-(6,69)
(6,60)-(6,68)
*)

(* all spans
(2,20)-(7,10)
(3,2)-(7,10)
(3,17)-(4,64)
(3,21)-(4,64)
(4,4)-(4,64)
(4,10)-(4,13)
(4,27)-(4,30)
(4,43)-(4,64)
(4,43)-(4,49)
(4,50)-(4,61)
(4,51)-(4,54)
(4,58)-(4,60)
(4,62)-(4,64)
(5,2)-(7,10)
(5,17)-(6,69)
(6,4)-(6,69)
(6,10)-(6,11)
(6,24)-(6,26)
(6,34)-(6,69)
(6,34)-(6,40)
(6,41)-(6,58)
(6,42)-(6,48)
(6,49)-(6,57)
(6,50)-(6,51)
(6,54)-(6,56)
(6,59)-(6,69)
(6,60)-(6,68)
(6,60)-(6,61)
(6,66)-(6,68)
(7,2)-(7,10)
(7,2)-(7,8)
(7,9)-(7,10)
*)
