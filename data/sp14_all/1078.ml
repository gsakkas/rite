
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else ((cloneHelper x n) - (1 x)) :: acc in
  cloneHelper x n [];;


(* fix

let rec clone x n =
  let rec cloneHelper (x,n,acc) =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;

*)

(* changed spans
(3,23)-(4,62)
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
(3,23)-(4,62)
(3,25)-(4,62)
(3,27)-(4,62)
(4,28)-(4,55)
(4,29)-(4,46)
(4,30)-(4,41)
(4,49)-(4,54)
(4,50)-(4,51)
(5,3)-(5,14)
(5,3)-(5,21)
*)
