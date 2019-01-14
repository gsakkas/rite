
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> fun x  -> ((f x), (x = (f x)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g x = let calcx = f x in (calcx, (calcx = x)) in (g, b));;

*)

(* changed spans
(4,29)-(4,71)
let g =
  fun x ->
    (let calcx = f x in
     (calcx , calcx = x)) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(4,50)-(4,70)
let calcx = f x in
(calcx , calcx = x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(4,58)-(4,69)
calcx
VarG

(4,58)-(4,69)
(calcx , calcx = x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(4,64)-(4,65)
calcx
VarG

(4,73)-(4,74)
g
VarG

(4,73)-(4,74)
(g , b)
TupleG (fromList [VarG])

*)
