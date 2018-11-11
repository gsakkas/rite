
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (if (f b) = b then ((f b), true) else (((f b), false), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(5,2)-(5,67)
fun b' -> (f b' , f b' = b')
LamG (TupleG [EmptyG,EmptyG])

(5,2)-(5,67)
let fx =
  fun b' ->
    (f b' , f b' = b') in
wwhile (fx , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(5,2)-(5,67)
(f b' , f b' = b')
TupleG [AppG [EmptyG],BopG EmptyG EmptyG]

(5,9)-(5,67)
f
VarG

(5,13)-(5,22)
b'
VarG

(5,28)-(5,41)
b'
VarG

(5,29)-(5,34)
b'
VarG

(5,47)-(5,66)
wwhile
VarG

(5,56)-(5,61)
fx
VarG

*)
