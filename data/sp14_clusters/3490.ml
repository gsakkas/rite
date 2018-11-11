
let notequals x y = x <> y;;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((notequals b), b);;


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
CaseG VarG [(Nothing,AppG [EmptyG]),(Nothing,VarG)]

(7,28)-(7,46)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(7,28)-(7,46)
fun x -> (0 , true)
LamG (TupleG [EmptyG,EmptyG])

(7,28)-(7,46)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(7,29)-(7,42)
0
LitG

(7,29)-(7,42)
true
LitG

(7,29)-(7,42)
(func b , b)
TupleG [AppG [EmptyG],VarG]

(7,30)-(7,39)
func
VarG

*)
