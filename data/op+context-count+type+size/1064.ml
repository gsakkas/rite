
let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> (helper (f :: acc) f x) - 1 in
     helper [] x n);;


(* fix

let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

*)

(* changed spans
(7,40)-(7,66)
(7,60)-(7,61)
*)

(* type error slice
(3,3)-(8,19)
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(4,8)-(4,10)
(6,6)-(8,19)
(6,21)-(7,66)
(6,25)-(7,66)
(6,27)-(7,66)
(7,8)-(7,66)
(7,14)-(7,15)
(7,28)-(7,31)
(7,40)-(7,46)
(7,40)-(7,61)
(7,40)-(7,66)
(7,48)-(7,49)
(7,48)-(7,56)
(7,53)-(7,56)
(7,58)-(7,59)
(7,60)-(7,61)
(8,6)-(8,12)
(8,6)-(8,19)
(8,13)-(8,15)
(8,16)-(8,17)
(8,18)-(8,19)
*)
