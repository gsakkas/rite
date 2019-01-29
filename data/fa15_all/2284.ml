
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,29)-(5,31)
fun x ->
  (let y = f x in (y , y <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,33)-(5,34)
f
VarG

(5,33)-(5,34)
x
VarG

(5,33)-(5,34)
y
VarG

(5,33)-(5,34)
y
VarG

(5,33)-(5,34)
x
VarG

(5,33)-(5,34)
f x
AppG (fromList [VarG])

(5,33)-(5,34)
y <> x
BopG VarG VarG

(5,33)-(5,34)
let y = f x in (y , y <> x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(5,33)-(5,34)
(y , y <> x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
