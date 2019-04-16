
let rec clone x n n = List.append (clone x (n - 1)) [x];;


(* fix

let rec clone x n = x :: (clone x (n - 1));;

*)

(* changed spans
(2,19)-(2,56)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,4)-(2,58)
(2,15)-(2,56)
(2,17)-(2,56)
(2,19)-(2,56)
(2,23)-(2,34)
(2,23)-(2,56)
(2,35)-(2,52)
(2,36)-(2,41)
*)
