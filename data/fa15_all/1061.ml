
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((((f b) = b), (f b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(4,28)-(4,53)
let fx =
  fun b' ->
    (f b' , f b' = b') in
wwhile (fx , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,29)-(4,49)
fun b' -> (f b' , f b' = b')
LamG (TupleG (fromList [EmptyG]))

(4,39)-(4,40)
b'
VarG

(4,43)-(4,48)
f b' = b'
BopG (AppG (fromList [EmptyG])) VarG

(4,46)-(4,47)
b'
VarG

(4,51)-(4,52)
b'
VarG

(4,51)-(4,52)
wwhile
VarG

(4,51)-(4,52)
fx
VarG

(4,51)-(4,52)
wwhile (fx , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(4,51)-(4,52)
(fx , b)
TupleG (fromList [VarG])

*)
