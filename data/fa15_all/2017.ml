
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((let g x = if (f x) = b then f x else f (x + 1) in g 0), b);;


(* fix

let fixpoint (f,b) = let rec g x = if (f x) = b then x else g (x + 1) in g 0;;

*)

(* changed spans
(6,3)-(6,70)
let rec g =
  fun x ->
    if f x = b
    then x
    else g (x + 1) in
g 0
LetG Rec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(3,3)-(3,78)
(3,17)-(3,18)
(3,17)-(3,20)
(3,64)-(3,70)
(3,64)-(3,78)
(3,71)-(3,78)
(3,72)-(3,73)
(3,75)-(3,77)
(6,3)-(6,9)
(6,3)-(6,70)
(6,10)-(6,70)
(6,11)-(6,66)
(6,18)-(6,58)
(6,22)-(6,58)
(6,25)-(6,30)
(6,25)-(6,34)
(6,26)-(6,27)
(6,33)-(6,34)
(6,49)-(6,50)
(6,49)-(6,58)
(6,62)-(6,63)
(6,62)-(6,65)
(6,68)-(6,69)
*)
