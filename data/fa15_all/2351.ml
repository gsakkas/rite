
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((let b' = f b in if b != b' then true else false), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(6,2)-(6,8)
let f' =
  fun b' ->
    (f b' , f b' <> b') in
wwhile (f' , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,9)-(6,63)
fun b' -> (f b' , f b' <> b')
LamG (TupleG (fromList [EmptyG]))

(6,27)-(6,58)
b'
VarG

(6,30)-(6,31)
f b'
AppG (fromList [VarG])

(6,35)-(6,37)
f
VarG

(6,53)-(6,58)
b'
VarG

(6,61)-(6,62)
wwhile
VarG

(6,61)-(6,62)
f'
VarG

(6,61)-(6,62)
wwhile (f' , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(6,61)-(6,62)
(f' , b)
TupleG (fromList [VarG])

*)
