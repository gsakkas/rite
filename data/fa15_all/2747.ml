
let rec clone x n = match n with | 0 -> x | _ -> x :: (clone x (n - 1));;


(* fix

let rec clone x n =
  let x' = abs n in if x' > 0 then [x] @ (clone x (n - 1)) else [];;

*)

(* changed spans
(2,21)-(2,72)
let x' = abs n in
if x' > 0
then [x] @ clone x (n - 1)
else []
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(2,74)
(2,15)-(2,72)
(2,17)-(2,72)
(2,21)-(2,72)
(2,41)-(2,42)
(2,50)-(2,51)
(2,50)-(2,72)
(2,55)-(2,72)
(2,56)-(2,61)
*)
