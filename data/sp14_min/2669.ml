
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let f' = (f, (b = (f b))) in ((f b), b));;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(4,29)-(4,70)
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
(4,22)-(4,70)
(4,29)-(4,70)
(4,43)-(4,54)
(4,44)-(4,45)
(4,48)-(4,53)
(4,49)-(4,50)
(4,59)-(4,69)
(4,60)-(4,65)
(4,61)-(4,62)
(4,67)-(4,68)
*)
