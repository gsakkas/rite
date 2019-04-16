
let rec clone x n = if n < 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n =
  let rec cloneHelper (x,n,acc) =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;

*)

(* changed spans
(2,21)-(2,58)
let rec cloneHelper =
  fun (x , n , acc) ->
    if n < 0
    then acc
    else cloneHelper (x , n - 1 , x :: acc) in
cloneHelper (x , n , [])
LetG Rec (fromList [(VarPatG,LamG (TuplePatG (fromList [EmptyPatG])) EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,21)-(2,58)
(2,35)-(2,37)
(2,43)-(2,58)
*)
