
let rec clone x n = if n = 0 then [] else x :: (clone (x (n - 1)));;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,48)-(2,67)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,69)
(2,15)-(2,67)
(2,48)-(2,67)
(2,49)-(2,54)
(2,55)-(2,66)
(2,56)-(2,57)
*)
