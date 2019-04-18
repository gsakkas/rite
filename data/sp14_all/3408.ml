
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
(7,39)-(7,66)
helper (f :: acc) f (x - 1)
AppG (fromList [VarG,AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(6,5)-(8,20)
(6,21)-(7,66)
(6,25)-(7,66)
(6,27)-(7,66)
(7,8)-(7,66)
(7,28)-(7,31)
(7,39)-(7,62)
(7,39)-(7,66)
(7,40)-(7,46)
(7,47)-(7,57)
(7,53)-(7,56)
*)
