
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile
    ((let f f b =
        if ((f b) = (b, true)) && ((b, true) = ((f b) - 1)) then (b, false) in
      f), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(8,47)-(8,58)
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
LetG NonRec [LamG EmptyG] VarG

(8,48)-(8,53)
fun x ->
  (let xx = f x in
   (xx , x <> b))
LamG (LetG NonRec [EmptyG] EmptyG)

(8,48)-(8,53)
let xx = f x in (xx , x <> b)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(8,56)-(8,57)
x
VarG

(8,66)-(8,67)
xx
VarG

(8,66)-(8,67)
x
VarG

(8,66)-(8,67)
x <> b
BopG VarG VarG

(9,6)-(9,7)
a
VarG

*)
