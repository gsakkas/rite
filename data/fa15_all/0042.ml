
let rec clone x n = if n <= 0 then [] else x :: (clone (n - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,48)-(2,63)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,55)-(2,62)
x
VarG

*)
