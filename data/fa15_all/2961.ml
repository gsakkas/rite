
let rec clone x n = if n = 1 then [x] else List.append [x] ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 1 then [x] else List.append [x] (clone x (n - 1));;

*)

(* changed spans
(2,60)-(2,77)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,79)
(2,15)-(2,77)
(2,17)-(2,77)
(2,21)-(2,77)
(2,44)-(2,55)
(2,44)-(2,77)
(2,60)-(2,77)
(2,61)-(2,72)
(2,62)-(2,67)
*)
