
let equ f b = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((equ f b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(5,30)-(5,63)
match c' with
| true -> wwhile (f , b')
| false -> b'
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(7,28)-(7,42)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(7,28)-(7,42)
fun x -> (0 , true)
LamG (TupleG (fromList [EmptyG]))

(7,28)-(7,42)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(7,34)-(7,35)
0
LitG

(7,36)-(7,37)
func
VarG

(7,36)-(7,37)
func b
AppG (fromList [VarG])

(7,36)-(7,37)
true
LitG

(7,36)-(7,37)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
