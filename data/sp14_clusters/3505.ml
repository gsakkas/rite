
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (fun f  -> ((f, ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,61)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(6,39)-(6,60)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(6,39)-(6,60)
fun x -> (0 , true)
LamG (TupleG [EmptyG,EmptyG])

(6,40)-(6,56)
0
LitG

(6,40)-(6,56)
true
LitG

(6,48)-(6,49)
func
VarG

*)
