
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b) <> b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,27)
f
VarG

(5,21)-(5,45)
fun x ->
  (let xx = f b in
   (xx , xx <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,21)-(5,45)
let f =
  fun x ->
    (let xx = f b in
     (xx , xx <> b)) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(5,21)-(5,45)
let xx = f b in (xx , xx <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(5,28)-(5,45)
b
VarG

(5,29)-(5,41)
xx
VarG

(5,30)-(5,35)
xx
VarG

(5,30)-(5,35)
b
VarG

(5,31)-(5,32)
wwhile
VarG

(5,31)-(5,32)
(f , b)
TupleG (fromList [VarG])

*)
