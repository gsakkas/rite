
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone t (n - 1)) :: h);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,8)-(5,65)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(5,8)-(5,65)
(5,15)-(5,16)
(5,30)-(5,31)
(5,42)-(5,64)
(5,63)-(5,64)
*)
