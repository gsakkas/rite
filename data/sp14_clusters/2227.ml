
let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) = wwhile ((b, (b <> (f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let f b = let b' = f b in (b', ((f b) <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,50)
fun b ->
  (let b' = f b in
   (b' , f b <> b))
LamG (LetG NonRec [EmptyG] EmptyG)

(5,21)-(5,50)
let f =
  fun b ->
    (let b' = f b in
     (b' , f b <> b)) in
wwhile (f , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(5,21)-(5,50)
let b' = f b in
(b' , f b <> b)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(5,29)-(5,46)
f
VarG

(5,33)-(5,45)
b'
VarG

(5,33)-(5,45)
(b' , f b <> b)
TupleG [VarG,BopG EmptyG EmptyG]

*)
