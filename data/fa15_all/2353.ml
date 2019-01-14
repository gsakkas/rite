
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let b' = f b in (b', (b' = b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(5,21)-(5,27)
let f' =
  fun b' ->
    (f b' , f b' <> b') in
wwhile (f' , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(5,28)-(5,65)
fun b' -> (f b' , f b' <> b')
LamG (TupleG (fromList [EmptyG]))

(5,51)-(5,59)
f b' <> b'
BopG (AppG (fromList [EmptyG])) VarG

(5,52)-(5,54)
f
VarG

(5,52)-(5,54)
f b'
AppG (fromList [VarG])

(5,57)-(5,58)
b'
VarG

(5,63)-(5,64)
wwhile
VarG

(5,63)-(5,64)
f'
VarG

(5,63)-(5,64)
wwhile (f' , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,63)-(5,64)
(f' , b)
TupleG (fromList [VarG])

*)
