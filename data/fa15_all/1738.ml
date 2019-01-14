
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b), (b = (f b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,49)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(5,29)-(5,49)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,51)-(5,52)
f'
VarG

*)
