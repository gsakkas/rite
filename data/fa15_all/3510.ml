
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile ((not (f b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,44)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(6,28)-(6,44)
fun x -> (0 , true)
LamG (TupleG (fromList [EmptyG]))

(6,28)-(6,44)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,30)-(6,33)
0
LitG

(6,34)-(6,39)
true
LitG

(6,34)-(6,39)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,35)-(6,36)
func
VarG

*)
