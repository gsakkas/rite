
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b)
  then let f b = (b, true) in wwhile (f, (f b))
  else wwhile (f b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(8,5)-(8,15)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

(9,41)-(9,46)
b
VarG

(9,41)-(9,46)
fun b -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(9,41)-(9,46)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(9,41)-(9,46)
(f b , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(10,7)-(10,19)
true
LitG

(10,14)-(10,19)
g
VarG

(10,14)-(10,19)
(g , f b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
