
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile (f, ((f b) = b));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(6,14)-(6,44)
fun x -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

(6,21)-(6,27)
b
VarG

(6,21)-(6,27)
let funt =
  fun x -> (f b , f b = b) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,21)-(6,44)
f b
AppG (fromList [VarG])

(6,34)-(6,35)
wwhile
VarG

(6,34)-(6,35)
funt
VarG

(6,34)-(6,35)
b
VarG

(6,34)-(6,35)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(6,34)-(6,35)
(funt , b)
TupleG (fromList [VarG])

*)
