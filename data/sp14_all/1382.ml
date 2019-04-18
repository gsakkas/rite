
let rec clone x n = if n <= 0 then x else clone [x] (n - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,36)-(2,37)
[]
ListG (fromList [])

(2,49)-(2,52)
x
VarG

*)

(* type error slice
(2,4)-(2,62)
(2,15)-(2,60)
(2,43)-(2,48)
(2,43)-(2,60)
(2,49)-(2,52)
(2,50)-(2,51)
*)
