
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let b' = f b in if b = b' then b else wwhile (f, b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,72)
let f =
  fun x ->
    (let xx = f b in
     (xx , xx <> b)) in
wwhile (f , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(5,30)-(5,33)
fun x ->
  (let xx = f b in
   (xx , xx <> b))
LamG (LetG NonRec [EmptyG] EmptyG)

(5,30)-(5,33)
let xx = f b in (xx , xx <> b)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(5,44)-(5,46)
(xx , xx <> b)
TupleG [VarG,BopG EmptyG EmptyG]

(5,52)-(5,53)
xx
VarG

(5,52)-(5,53)
xx
VarG

(5,52)-(5,53)
xx <> b
BopG VarG VarG

*)
