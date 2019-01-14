
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b = f b in ((b, (b != b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(5,28)-(5,63)
fun x ->
  (let b = f x in (b , b <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,28)-(5,63)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
TupleG (fromList [VarG,LamG EmptyG])

(5,44)-(5,62)
x
VarG

(5,55)-(5,56)
x
VarG

*)
