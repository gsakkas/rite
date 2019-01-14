
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g b = ((f b), (if (f b) = b then false else true)) in (g, b));;

*)

(* changed spans
(5,14)-(5,48)
x
VarG

(5,28)-(5,48)
fun b ->
  (f b , if f b = b
         then false
         else true)
LamG (TupleG (fromList [EmptyG]))

(5,28)-(5,48)
let g =
  fun b ->
    (f b , if f b = b
           then false
           else true) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(5,46)-(5,47)
f
VarG

(5,46)-(5,47)
f b
AppG (fromList [VarG])

(5,46)-(5,47)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(5,46)-(5,47)
if f b = b
then false
else true
IteG (BopG EmptyG EmptyG) LitG LitG

*)
