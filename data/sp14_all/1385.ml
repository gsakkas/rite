
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> [clone t (n - 1); h]);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,8)-(5,63)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,4)-(5,65)
(2,15)-(5,63)
(2,17)-(5,63)
(3,3)-(5,63)
(5,8)-(5,63)
(5,30)-(5,31)
(5,42)-(5,62)
(5,43)-(5,48)
(5,43)-(5,58)
(5,49)-(5,50)
(5,60)-(5,61)
*)
