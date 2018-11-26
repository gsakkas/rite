
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then ((f b), true) else ((f b), false)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(5,2)-(5,8)
let fx =
  fun b' ->
    (f b' , f b' = b') in
wwhile (fx , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(5,9)-(5,67)
fun b' -> (f b' , f b' = b')
LamG (TupleG (fromList [EmptyG]))

(5,29)-(5,42)
b'
VarG

(5,30)-(5,35)
f b' = b'
BopG (AppG (fromList [EmptyG])) VarG

(5,48)-(5,62)
b'
VarG

(5,49)-(5,54)
b'
VarG

(5,56)-(5,61)
wwhile
VarG

(5,65)-(5,66)
fx
VarG

(5,65)-(5,66)
(fx , b)
TupleG (fromList [VarG])

*)
