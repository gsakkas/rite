
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((match f b with | b -> b | _ -> wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,10)-(6,56)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(6,17)-(6,20)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(6,17)-(6,20)
(f b , b = f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(6,33)-(6,34)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

(6,58)-(6,59)
f'
VarG

*)
