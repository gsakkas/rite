
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (true, b) else (false, b)), b);;


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
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(5,9)-(5,59)
fun b' -> (f b' , f b' = b')
LamG (TupleG [EmptyG,EmptyG])

(5,10)-(5,55)
f b'
AppG [VarG]

(5,14)-(5,23)
f
VarG

(5,14)-(5,23)
b'
VarG

(5,36)-(5,37)
b'
VarG

(5,44)-(5,54)
b'
VarG

(5,44)-(5,54)
wwhile
VarG

(5,44)-(5,54)
wwhile (fx , b)
AppG [TupleG [EmptyG,EmptyG]]

(5,52)-(5,53)
fx
VarG

*)
