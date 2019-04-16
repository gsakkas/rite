
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone h) :: (x (n - 1)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,8)-(5,67)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(3,3)-(5,67)
(4,8)-(4,10)
(5,8)-(5,67)
(5,15)-(5,16)
(5,30)-(5,31)
(5,42)-(5,66)
(5,55)-(5,66)
(5,56)-(5,57)
*)
