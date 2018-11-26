
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = ((wwhile (fun x  -> ((not x), ((f b) = b)))), b);;


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

(5,30)-(5,64)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(5,41)-(5,63)
fun x -> (0 , true)
LamG (TupleG (fromList [EmptyG]))

(5,51)-(5,62)
0
LitG

(5,52)-(5,57)
true
LitG

(5,52)-(5,57)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(5,55)-(5,56)
func
VarG

*)
