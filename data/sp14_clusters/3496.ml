
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((f b) <> b), b);;


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

(5,28)-(5,45)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(5,28)-(5,45)
fun x -> (0 , true)
LamG (TupleG [EmptyG,EmptyG])

(5,28)-(5,45)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(5,29)-(5,41)
0
LitG

(5,30)-(5,35)
true
LitG

(5,30)-(5,35)
(func b , b)
TupleG [AppG [EmptyG],VarG]

(5,33)-(5,34)
func
VarG

*)
