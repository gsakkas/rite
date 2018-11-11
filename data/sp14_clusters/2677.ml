
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let f' = f b in ((f', ((f b) = b)), b));;


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

(2,47)-(2,49)
b' = b
BopG VarG VarG

(2,55)-(2,61)
helper
VarG

(2,55)-(2,69)
b'
VarG

(2,55)-(2,69)
b
VarG

(2,55)-(2,69)
b'
VarG

(4,45)-(4,67)
helper
VarG

*)
