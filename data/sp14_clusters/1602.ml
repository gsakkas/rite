
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile
    ((let (x,y) = f b in
      if (x <> b) && (y = true) then (x, y) else if x = b then (x, false)),
      b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(7,5)-(8,74)
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
LetG NonRec [LamG EmptyG] VarG

(7,18)-(7,21)
fun x ->
  (let xx = f x in
   (xx , x <> b))
LamG (LetG NonRec [EmptyG] EmptyG)

(7,18)-(7,21)
let xx = f x in (xx , x <> b)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(8,49)-(8,73)
a
VarG

(8,52)-(8,53)
x <> b
BopG VarG VarG

(8,52)-(8,57)
xx
VarG

*)
