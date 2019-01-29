
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(3,30)-(3,63)
match c' with
| true -> wwhile (f , b')
| false -> b'
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(5,28)-(5,50)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(5,28)-(5,50)
fun x -> (0 , true)
LamG (TupleG (fromList [EmptyG]))

(5,28)-(5,50)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(5,34)-(5,45)
0
LitG

(5,35)-(5,40)
true
LitG

(5,35)-(5,40)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(5,38)-(5,39)
func
VarG

*)
