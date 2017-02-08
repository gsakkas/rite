
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
(6,6)-(8,19)
(6,21)-(7,66)
(6,25)-(7,66)
(6,27)-(7,66)
(7,8)-(7,66)
(7,8)-(7,66)
(7,28)-(7,31)
(7,40)-(7,46)
(7,40)-(7,61)
(7,40)-(7,66)
(7,40)-(7,66)
(7,48)-(7,56)
(7,53)-(7,56)
*)
