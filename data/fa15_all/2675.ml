
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let f' b' = let bb = f b in (bb, (bb = (f b))) in ((wwhile (f', b)), b));;


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
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(2,37)-(2,40)
fun (f , b) ->
  (let b' = f b in
   if b' = b
   then b'
   else helper (f , b'))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,37)-(2,40)
let b' = f b in
if b' = b
then b'
else helper (f , b')
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(2,63)-(2,64)
b' = b
BopG VarG VarG

(2,75)-(2,77)
b
VarG

(6,28)-(6,29)
helper
VarG

(6,55)-(6,76)
b'
VarG

(6,57)-(6,63)
helper
VarG

(6,69)-(6,70)
f
VarG

*)
