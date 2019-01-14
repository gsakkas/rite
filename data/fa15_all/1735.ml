
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f (f b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,38)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(5,29)-(5,38)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,29)-(5,38)
(f b , b = f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(5,32)-(5,37)
b
VarG

(5,32)-(5,37)
b
VarG

(5,32)-(5,37)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

(5,40)-(5,41)
f'
VarG

*)
