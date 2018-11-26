
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (match (f, b) with | (b',c') -> (((f b') <> b'), b));;


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

(6,9)-(6,61)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,16)-(6,22)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(6,16)-(6,22)
fun x -> (0 , true)
LamG (TupleG (fromList [EmptyG]))

(6,20)-(6,21)
0
LitG

(6,41)-(6,60)
true
LitG

(6,53)-(6,55)
func
VarG

*)
