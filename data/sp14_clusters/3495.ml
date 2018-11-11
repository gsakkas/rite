
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun b  -> ((b, ((f b) = b)), b));;


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

(5,28)-(5,61)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(5,39)-(5,60)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(5,39)-(5,60)
fun x -> (0 , true)
LamG (TupleG [EmptyG,EmptyG])

(5,40)-(5,56)
0
LitG

(5,40)-(5,56)
true
LitG

(5,48)-(5,49)
func
VarG

*)
