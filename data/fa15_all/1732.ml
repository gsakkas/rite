
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b) = b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,40)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,30)-(5,35)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(5,30)-(5,35)
(f b , b = f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(5,38)-(5,39)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

(5,42)-(5,43)
f
VarG

(5,42)-(5,43)
f b
AppG (fromList [VarG])

*)
