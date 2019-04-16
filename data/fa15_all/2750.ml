
let rec clone x n = if n = 0 then x else [clone x (n - 1)];;


(* fix

let rec clone x n =
  let x' = abs n in if x' > 0 then [x] @ (clone x (n - 1)) else [];;

*)

(* changed spans
(2,21)-(2,59)
let x' = abs n in
if x' > 0
then [x] @ clone x (n - 1)
else []
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(2,61)
(2,15)-(2,59)
(2,17)-(2,59)
(2,21)-(2,59)
(2,42)-(2,59)
(2,43)-(2,48)
(2,43)-(2,58)
*)
