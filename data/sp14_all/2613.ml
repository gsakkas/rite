
let rec clone x n =
  let acc = [x] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [0] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,14)-(3,15)
0
LitG

(3,40)-(3,50)
x
VarG

*)

(* type error slice
(2,4)-(3,68)
(2,15)-(3,66)
(3,34)-(3,39)
(3,34)-(3,58)
(3,40)-(3,50)
(3,41)-(3,42)
*)
