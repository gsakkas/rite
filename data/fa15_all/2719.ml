
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> fun x  -> ((f x), (x = (f x)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g x = let calcx = f x in (calcx, (calcx = x)) in (g, b));;

*)

(* changed spans
(4,29)-(4,76)
let g =
  fun x ->
    (let calcx = f x in
     (calcx , calcx = x)) in
(g , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(2,24)-(2,73)
(2,36)-(2,37)
(2,36)-(2,39)
(2,53)-(2,59)
(2,53)-(2,66)
(2,60)-(2,66)
(2,61)-(2,62)
(4,22)-(4,28)
(4,22)-(4,76)
(4,29)-(4,76)
(4,30)-(4,72)
(4,41)-(4,71)
*)
