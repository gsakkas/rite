
let rec wwhile (f,b) = let (b',c') = f b in if c' then f b' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,55)-(2,56)
wwhile
VarG

(2,55)-(2,56)
(f , b')
TupleG (fromList [VarG])

*)
