
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let f' b = ((f b), (b = (f b))) in ((f' (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,9)-(6,62)
(let f' =
   fun b -> (f b , b = f b) in
 f' , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

*)