
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let fb = f b in (fb, (fb = b))), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let w b' = let fb = f b' in (fb, (fb = b')) in wwhile (w, b);;

*)

(* changed spans
(4,28)-(4,65)
let w =
  fun b' ->
    (let fb = f b' in
     (fb , fb = b')) in
wwhile (w , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(4,29)-(4,61)
fun b' ->
  (let fb = f b' in
   (fb , fb = b'))
LamG (LetG NonRec [EmptyG] EmptyG)

(4,41)-(4,42)
b'
VarG

(4,57)-(4,58)
b'
VarG

(4,63)-(4,64)
wwhile
VarG

(4,63)-(4,64)
w
VarG

(4,63)-(4,64)
wwhile (w , b)
AppG [TupleG [EmptyG,EmptyG]]

(4,63)-(4,64)
(w , b)
TupleG [VarG,VarG]

*)
