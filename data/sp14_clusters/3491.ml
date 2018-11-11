
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> (((f b) = b), b));;


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

(5,28)-(5,56)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(5,39)-(5,55)
fun x -> (0 , true)
LamG (TupleG [EmptyG,EmptyG])

(5,40)-(5,51)
0
LitG

(5,41)-(5,46)
true
LitG

(5,41)-(5,46)
(func b , b)
TupleG [AppG [EmptyG],VarG]

(5,44)-(5,45)
func
VarG

*)
