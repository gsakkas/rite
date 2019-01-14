
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (fun x  -> (((f b), (not ((f b) = b))), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (let func x x = ((f b), (not ((f b) = b))) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,71)
let func =
  fun x ->
    fun x ->
      (f b , not (f b = b)) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,39)-(6,70)
fun x -> (f b , not (f b = b))
LamG (TupleG (fromList [EmptyG]))

(6,68)-(6,69)
func
VarG

(6,68)-(6,69)
func b
AppG (fromList [VarG])

(6,68)-(6,69)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
