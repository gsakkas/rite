
let rec clone x n = match n with | 0 -> [] | _ -> (clone x (n - 1)) :: x;;


(* fix

let rec clone x n =
  let x' = abs n in if x' > 0 then [x] @ (clone x (n - 1)) else [];;

*)

(* changed spans
(2,21)-(2,73)
let x' = abs n in
if x' > 0
then [x] @ clone x (n - 1)
else []
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(2,75)
(2,15)-(2,73)
(2,17)-(2,73)
(2,21)-(2,73)
(2,51)-(2,68)
(2,51)-(2,73)
(2,52)-(2,57)
*)
