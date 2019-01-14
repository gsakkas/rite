
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((let func (x,y) = (f x) = y in func), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((fun b'  -> let x = f b' in (x, (b' != x))), b);;

*)

(* changed spans
(5,47)-(5,52)
let x = f b' in (x , b' <> x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(5,47)-(5,56)
fun b' ->
  (let x = f b' in
   (x , b' <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,50)-(5,51)
b'
VarG

(5,50)-(5,51)
(x , b' <> x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(5,60)-(5,64)
b' <> x
BopG VarG VarG

(5,67)-(5,68)
b'
VarG

(5,67)-(5,68)
x
VarG

*)
