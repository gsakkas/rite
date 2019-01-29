
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  let f x = let xx = f x in (xx, (xx != b)) in f wwhile (f, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(8,23)-(8,24)
let g = fun b -> (b , f b) in
wwhile (g , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(8,28)-(8,43)
fun b -> (b , f b)
LamG (TupleG (fromList [EmptyG]))

(8,47)-(8,62)
f b
AppG (fromList [VarG])

(8,49)-(8,55)
b
VarG

(8,49)-(8,55)
wwhile (g , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(8,57)-(8,58)
g
VarG

*)
