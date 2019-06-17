
let rec clone x n = if n = 0 then [] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,48)-(2,65)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(2,67)
(2,15)-(2,65)
(2,17)-(2,65)
(2,21)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,60)
(2,50)-(2,55)
*)
