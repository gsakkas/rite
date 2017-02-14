
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
(7,38)-(7,65)
(7,59)-(7,60)
*)

(* type error slice
(6,4)-(8,19)
(6,20)-(7,65)
(6,24)-(7,65)
(6,26)-(7,65)
(7,7)-(7,65)
(7,7)-(7,65)
(7,27)-(7,30)
(7,38)-(7,61)
(7,38)-(7,65)
(7,38)-(7,65)
(7,39)-(7,45)
(7,46)-(7,56)
(7,52)-(7,55)
*)
