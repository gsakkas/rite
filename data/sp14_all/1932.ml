
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b) then let f = ((f b), true) in wwhile (f, (f b)) else b;;


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

(8,21)-(8,63)
f b
AppG (fromList [VarG])

(8,29)-(8,42)
f
VarG

(8,29)-(8,42)
b
VarG

(8,29)-(8,42)
fun b -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(8,29)-(8,42)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(8,54)-(8,55)
g
VarG

*)
