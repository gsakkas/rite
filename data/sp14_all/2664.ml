
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b' = f b in ((f, (b' = b)), b));;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(4,29)-(4,65)
(h , b)
TupleG (fromList [VarG])

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(4,22)-(4,28)
(4,22)-(4,65)
(4,29)-(4,65)
(4,46)-(4,64)
(4,47)-(4,60)
*)
