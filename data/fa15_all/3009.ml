
let rec clone x n = if n = 1 then [] @ x else (clone [x]) @ ((x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,24)-(2,29)
n <= 0
BopG VarG LitG

(2,35)-(2,41)
[]
ListG (fromList [])

(2,47)-(2,72)
x :: (clone x (n - 1))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,74)
(2,15)-(2,72)
(2,35)-(2,41)
(2,38)-(2,39)
(2,40)-(2,41)
(2,47)-(2,58)
(2,47)-(2,72)
(2,48)-(2,53)
(2,54)-(2,57)
(2,55)-(2,56)
(2,59)-(2,60)
(2,61)-(2,72)
(2,62)-(2,67)
(2,63)-(2,64)
*)
