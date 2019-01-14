
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((match f b with | b -> b | _ -> (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,68)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,36)-(5,39)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(5,36)-(5,39)
(f b , b = f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(5,52)-(5,53)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

(5,61)-(5,67)
f b
AppG (fromList [VarG])

(5,70)-(5,71)
f'
VarG

*)
