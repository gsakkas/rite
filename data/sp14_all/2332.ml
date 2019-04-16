
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: (accum (n - 1));;


(* fix

let rec clone x n =
  let accum = [] in
  let helper x n = if n < 1 then accum else x :: accum in helper x (n - 1);;

*)

(* changed spans
(3,21)-(3,71)
let helper =
  fun x ->
    fun n ->
      if n < 1
      then accum
      else x :: accum in
helper x (n - 1)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(3,73)
(2,15)-(3,71)
(2,17)-(3,71)
(3,3)-(3,71)
(3,15)-(3,17)
(3,21)-(3,71)
(3,43)-(3,52)
(3,43)-(3,71)
(3,44)-(3,49)
(3,56)-(3,71)
(3,57)-(3,62)
*)
