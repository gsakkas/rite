
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g b = ((f b), (if (f b) = b then false else true)) in (g, b));;

*)

(* changed spans
(5,14)-(6,63)
x
VarG

(6,9)-(6,63)
fun b ->
  (f b , if f b = b
         then false
         else true)
LamG (TupleG (fromList [EmptyG]))

(6,9)-(6,63)
let g =
  fun b ->
    (f b , if f b = b
           then false
           else true) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,10)-(6,59)
f
VarG

(6,10)-(6,59)
b
VarG

(6,10)-(6,59)
f b
AppG (fromList [VarG])

(6,61)-(6,62)
g
VarG

(6,61)-(6,62)
(g , b)
TupleG (fromList [VarG])

*)
