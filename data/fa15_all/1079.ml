
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
(3,26)-(4,63)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
LamG (IteG EmptyG EmptyG EmptyG)

(5,2)-(5,20)
cloneHelper (x , n , [])
AppG (fromList [TupleG (fromList [EmptyG])])

(5,14)-(5,15)
(x , n , [])
TupleG (fromList [VarG,ListG EmptyG Nothing])

*)
