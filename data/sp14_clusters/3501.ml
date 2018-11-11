
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not f), ((f b) = b), b);;


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
CaseG VarG [(Nothing,AppG [EmptyG]),(Nothing,VarG)]

(5,38)-(5,49)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(5,39)-(5,44)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(5,39)-(5,44)
fun x -> (0 , true)
LamG (TupleG [EmptyG,EmptyG])

(5,39)-(5,44)
0
LitG

(5,39)-(5,44)
true
LitG

(5,39)-(5,44)
(0 , true)
TupleG [LitG,LitG]

(5,39)-(5,44)
(func b , b)
TupleG [AppG [EmptyG],VarG]

(5,42)-(5,43)
func
VarG

*)
