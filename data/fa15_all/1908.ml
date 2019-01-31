
let intboolf f b = ((f b), ((f b) == 0));;

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
(2,13)-(2,40)
fun (f , b) ->
  fun b -> (f b , f b = b)
LamG (LamG EmptyG)

(2,37)-(2,38)
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
