
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let b' = (b, ((f b) < b)) in wwhile (f, b');;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), (b = (f b))) in wwhile (f, b);;

*)

(* changed spans
(4,21)-(4,64)
let f =
  fun b -> (f b , b = f b) in
wwhile (f , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(4,30)-(4,46)
fun b -> (f b , b = f b)
LamG (TupleG [EmptyG,EmptyG])

(4,43)-(4,44)
b = f b
BopG VarG (AppG [EmptyG])

(4,50)-(4,56)
f
VarG

(4,50)-(4,56)
b
VarG

(4,50)-(4,56)
wwhile (f , b)
AppG [TupleG [EmptyG,EmptyG]]

(4,61)-(4,63)
b
VarG

*)
