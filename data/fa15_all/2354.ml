
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let q = f b in (q, (q != b))), b);;


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

(5,28)-(5,63)
fun b' -> (f b' , f b' <> b')
LamG (TupleG (fromList [EmptyG]))

(5,46)-(5,47)
b'
VarG

(5,55)-(5,56)
f b'
AppG (fromList [VarG])

(5,61)-(5,62)
f
VarG

(5,61)-(5,62)
b'
VarG

(5,61)-(5,62)
b'
VarG

(5,61)-(5,62)
wwhile
VarG

(5,61)-(5,62)
f'
VarG

(5,61)-(5,62)
wwhile (f' , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,61)-(5,62)
(f' , b)
TupleG (fromList [VarG])

*)
