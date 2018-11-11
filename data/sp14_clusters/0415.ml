
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let w b' = let fb = f b' in (fb, (fb = b')) in f b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let w b' = let fb = f b' in (fb, (fb = b')) in wwhile (w, b);;

*)

(* changed spans
(5,60)-(5,61)
wwhile
VarG

(5,64)-(5,65)
w
VarG

(5,64)-(5,65)
(w , b)
TupleG [VarG,VarG]

*)
