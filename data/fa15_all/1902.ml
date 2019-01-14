
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (f, (((f b) = (f (b - 1))) && ((f b) = b)));;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(3,2)-(3,63)
f
VarG

(3,2)-(3,63)
b
VarG

(3,2)-(3,63)
f
VarG

(3,2)-(3,63)
b
VarG

(3,2)-(3,63)
b
VarG

(3,2)-(3,63)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

(3,2)-(3,63)
fun (f , b) ->
  match f b with
  | (b' , c') -> if c'
                 then wwhile (f , b')
                 else b'
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,2)-(3,63)
f b
AppG (fromList [VarG])

(3,2)-(3,63)
f b
AppG (fromList [VarG])

(3,2)-(3,63)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(3,2)-(3,63)
(f b , f b = b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(5,59)-(5,64)
func
VarG

(5,60)-(5,61)
(f , b)
TupleG (fromList [VarG])

*)
