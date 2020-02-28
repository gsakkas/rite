
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let f' b' = (f, ((f b) = b)) in ((f b), b));;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(4,29)-(4,73)
(h , b)
TupleG [VarG,VarG]

*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(2,67)-(2,69)
(4,22)-(4,28)
(4,22)-(4,73)
(4,29)-(4,73)
(4,46)-(4,57)
(4,47)-(4,52)
(4,48)-(4,49)
(4,55)-(4,56)
(4,62)-(4,72)
(4,63)-(4,68)
(4,64)-(4,65)
(4,70)-(4,71)
*)
