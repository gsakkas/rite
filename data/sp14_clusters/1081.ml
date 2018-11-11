
let rec clone x n = if n < 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n =
  let rec cloneHelper (x,n,acc) =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;

*)

(* changed spans
(2,20)-(2,57)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
LamG (IteG EmptyG EmptyG EmptyG)

(2,20)-(2,57)
let rec cloneHelper =
  fun (x , n , acc) ->
    if n < 0
    then acc
    else cloneHelper (x , n - 1 , x :: acc) in
cloneHelper (x , n , [])
LetG Rec [LamG EmptyG] (AppG [EmptyG])

(2,43)-(2,48)
acc
VarG

(2,49)-(2,50)
cloneHelper
VarG

(2,49)-(2,50)
cloneHelper (x , n - 1 , x :: acc)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(2,49)-(2,50)
(x , n - 1 , x :: acc)
TupleG [VarG,BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing]

(2,51)-(2,52)
n - 1
BopG VarG LitG

*)
