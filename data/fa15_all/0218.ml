
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile ((let n z = (f, (b = (f b))) in n), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,45)-(6,46)
fun x ->
  (let ff = f b in
   (ff , b = ff))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,49)-(6,54)
let ff = f b in (ff , b = ff)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(6,60)-(6,61)
ff
VarG

(6,60)-(6,61)
b
VarG

(6,60)-(6,61)
ff
VarG

(6,60)-(6,61)
b = ff
BopG VarG VarG

(6,60)-(6,61)
(ff , b = ff)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,60)-(6,61)
(n , b)
TupleG (fromList [VarG])

*)
