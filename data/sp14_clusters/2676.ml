
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let f' b' = f b in ((f, ((f b) = b)), b));;


(* fix

let fixpoint (f,b) =
  let rec helper (f,b) =
    let b' = f b in if b' = b then b' else helper (f, b') in
  helper (f, b);;

*)

(* changed spans
(2,23)-(2,77)
let rec helper =
  fun (f , b) ->
    (let b' = f b in
     if b' = b
     then b'
     else helper (f , b')) in
helper (f , b)
LetG Rec [LamG EmptyG] (AppG [EmptyG])

(2,37)-(2,40)
fun (f , b) ->
  (let b' = f b in
   if b' = b
   then b'
   else helper (f , b'))
LamG (LetG NonRec [EmptyG] EmptyG)

(2,37)-(2,40)
let b' = f b in
if b' = b
then b'
else helper (f , b')
LetG NonRec [AppG [EmptyG]] (IteG EmptyG EmptyG EmptyG)

(2,63)-(2,64)
b' = b
BopG VarG VarG

(2,75)-(2,77)
b
VarG

(4,48)-(4,69)
helper
VarG

(4,53)-(4,64)
b'
VarG

(4,55)-(4,56)
helper
VarG

(4,55)-(4,56)
(f , b)
TupleG [VarG,VarG]

*)
