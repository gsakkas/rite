
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) = wwhile ((let (x,y) = f b in (x, (x != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(5,29)-(5,63)
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
LetG NonRec [LamG EmptyG] VarG

(5,42)-(5,45)
fun x ->
  (let xx = f x in
   (xx , x <> b))
LamG (LetG NonRec [EmptyG] EmptyG)

(5,42)-(5,45)
let xx = f x in (xx , x <> b)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(5,53)-(5,61)
xx
VarG

(5,53)-(5,61)
(xx , x <> b)
TupleG [VarG,BopG EmptyG EmptyG]

(5,65)-(5,66)
a
VarG

*)
