
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  let f' x = if (f x) = b then f x else (f x) + 1 in wwhile (f', b);;


(* fix

let fixpoint (f,b) = let rec g x = if (f x) = b then x else g (x + 1) in g 0;;

*)

(* changed spans
(6,3)-(6,68)
let rec g =
  fun x ->
    if f x = b
    then x
    else g (x + 1) in
g 0
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(3,78)
(3,17)-(3,18)
(3,17)-(3,20)
(3,64)-(3,70)
(3,64)-(3,78)
(3,71)-(3,78)
(3,72)-(3,73)
(6,3)-(6,68)
(6,10)-(6,50)
(6,14)-(6,50)
(6,41)-(6,50)
(6,54)-(6,60)
(6,54)-(6,68)
(6,61)-(6,68)
(6,62)-(6,64)
*)
