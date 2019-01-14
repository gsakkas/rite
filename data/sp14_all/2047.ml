
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let b' = (b, ((f b) = b)) in wwhile (f, b');;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), (b = (f b))) in wwhile (f, b);;

*)

(* changed spans
(4,21)-(4,64)
let f =
  fun b -> (f b , b = f b) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,30)-(4,46)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(4,31)-(4,32)
f
VarG

(4,31)-(4,32)
f b
AppG (fromList [VarG])

(4,35)-(4,40)
b
VarG

(4,61)-(4,63)
b
VarG

*)
