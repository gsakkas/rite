
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (((f b), false), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,29)-(6,43)
let d =
  fun x ->
    (let xx = f b in
     (xx , xx = b)) in
d
LetG NonRec (fromList [LamG EmptyG]) VarG

(6,30)-(6,35)
fun x ->
  (let xx = f b in
   (xx , xx = b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,30)-(6,35)
let xx = f b in (xx , xx = b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(6,37)-(6,42)
(xx , xx = b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,45)-(6,46)
xx
VarG

(6,45)-(6,46)
xx
VarG

(6,45)-(6,46)
xx = b
BopG VarG VarG

*)
