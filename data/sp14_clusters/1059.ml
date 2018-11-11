
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((((f b) = b), b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(4,28)-(4,49)
let fx =
  fun b' ->
    (f b' , f b' = b') in
wwhile (fx , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(4,29)-(4,45)
fun b' -> (f b' , f b' = b')
LamG (TupleG [EmptyG,EmptyG])

(4,30)-(4,41)
f
VarG

(4,30)-(4,41)
b'
VarG

(4,30)-(4,41)
f b'
AppG [VarG]

(4,43)-(4,44)
b'
VarG

(4,47)-(4,48)
b'
VarG

(4,47)-(4,48)
wwhile
VarG

(4,47)-(4,48)
fx
VarG

(4,47)-(4,48)
wwhile (fx , b)
AppG [TupleG [EmptyG,EmptyG]]

(4,47)-(4,48)
(fx , b)
TupleG [VarG,VarG]

*)
