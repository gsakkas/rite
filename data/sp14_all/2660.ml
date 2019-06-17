
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (f, ((f b) = b), b);;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(4,29)-(4,48)
(h , b)
TupleG [VarG,VarG]

*)

(* type error slice
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(4,22)-(4,28)
(4,22)-(4,48)
(4,29)-(4,48)
*)
