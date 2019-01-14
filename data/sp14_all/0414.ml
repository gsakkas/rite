
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let w b = let fb = f b in (fb, (fb = b)) in f b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let w b' = let fb = f b' in (fb, (fb = b')) in wwhile (w, b);;

*)

(* changed spans
(5,17)-(5,51)
fun b' ->
  (let fb = f b' in
   (fb , fb = b'))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,32)-(5,33)
b'
VarG

(5,48)-(5,49)
b'
VarG

(5,57)-(5,58)
wwhile
VarG

(5,61)-(5,62)
w
VarG

(5,61)-(5,62)
(w , b)
TupleG (fromList [VarG])

*)
