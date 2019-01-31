
let intboolf f x = ((f x), ((f x) < 1));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (intboolf, b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(2,15)-(2,39)
fun (f , b) ->
  fun b -> (f b , f b = b)
LamG (LamG EmptyG)

(2,19)-(2,39)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

(2,27)-(2,38)
b
VarG

(2,28)-(2,33)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(2,36)-(2,37)
b
VarG

(4,16)-(5,63)
b
VarG

(7,29)-(7,37)
func (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(7,39)-(7,40)
func
VarG

(7,39)-(7,40)
f
VarG

(7,39)-(7,40)
(f , b)
TupleG (fromList [VarG])

*)
