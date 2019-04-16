
let rec clone x n = if n = 0 then x else x :: (clone x (n - 1));;


(* fix

let rec clone x n =
  let x' = abs n in if x' > 0 then [x] @ (clone x (n - 1)) else [];;

*)

(* changed spans
(2,21)-(2,64)
let x' = abs n in
if x' > 0
then [x] @ clone x (n - 1)
else []
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,21)-(2,64)
(2,35)-(2,36)
(2,42)-(2,43)
(2,42)-(2,64)
*)
