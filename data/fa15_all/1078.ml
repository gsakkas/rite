
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
(3,26)-(4,61)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
LamG (IteG EmptyG EmptyG EmptyG)

(4,28)-(4,45)
cloneHelper (x , n - 1 , x :: acc)
AppG (fromList [TupleG (fromList [EmptyG])])

(4,41)-(4,42)
(x , n - 1 , x :: acc)
TupleG (fromList [VarG,BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(4,43)-(4,44)
n - 1
BopG VarG LitG

(4,51)-(4,52)
x :: acc
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(5,2)-(5,20)
cloneHelper (x , n , [])
AppG (fromList [TupleG (fromList [EmptyG])])

(5,14)-(5,15)
(x , n , [])
TupleG (fromList [VarG,ListG EmptyG Nothing])

*)
