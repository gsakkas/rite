
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper x n [];;


(* fix

let rec clone x n =
  let rec cloneHelper (x,n,acc) =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;

*)

(* changed spans
(3,23)-(4,64)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
LamG (TuplePatG (fromList [VarPatG])) (IteG EmptyG EmptyG EmptyG)

(5,3)-(5,21)
cloneHelper (x , n , [])
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(5,21)
(3,23)-(4,64)
(4,5)-(4,64)
(4,19)-(4,22)
(4,28)-(4,39)
(4,28)-(4,64)
(4,40)-(4,64)
(4,53)-(4,63)
(4,54)-(4,55)
(4,59)-(4,62)
(5,3)-(5,14)
(5,3)-(5,21)
*)
