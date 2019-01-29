
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (b, b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(3,62)
x
VarG

(2,16)-(3,62)
x
VarG

(2,16)-(3,62)
x
VarG

(2,16)-(3,62)
fun x -> (x * x , x < 100)
LamG (TupleG (fromList [EmptyG]))

(2,16)-(3,62)
x * x
BopG VarG VarG

(2,16)-(3,62)
x < 100
BopG VarG LitG

(2,16)-(3,62)
100
LitG

(2,16)-(3,62)
(x * x , x < 100)
TupleG (fromList [BopG EmptyG EmptyG])

(5,29)-(5,30)
h
VarG

*)
