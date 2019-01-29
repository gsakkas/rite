
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fb = f b in ((fb, (fb = b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let w b' = let fb = f b' in (fb, (fb = b')) in wwhile (w, b);;

*)

(* changed spans
(4,21)-(4,27)
let w =
  fun b' ->
    (let fb = f b' in
     (fb , fb = b')) in
wwhile (w , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,28)-(4,65)
fun b' ->
  (let fb = f b' in
   (fb , fb = b'))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,45)-(4,64)
b'
VarG

(4,57)-(4,58)
b'
VarG

(4,62)-(4,63)
wwhile
VarG

(4,62)-(4,63)
w
VarG

(4,62)-(4,63)
wwhile (w , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(4,62)-(4,63)
(w , b)
TupleG (fromList [VarG])

*)
