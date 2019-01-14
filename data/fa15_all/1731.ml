
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,30)-(5,36)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,37)-(5,43)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(5,38)-(5,39)
f b
AppG (fromList [VarG])

(5,46)-(5,47)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

*)
