
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b' = f b in ((f, (b' = b)), b));;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,17)-(2,78)
(2,24)-(2,78)
(4,30)-(4,63)
(4,39)-(4,40)
(4,39)-(4,42)
(4,41)-(4,42)
(4,48)-(4,49)
(4,48)-(4,58)
(4,52)-(4,54)
(4,52)-(4,58)
(4,57)-(4,58)
(4,62)-(4,63)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(4,22)-(4,28)
(4,22)-(4,63)
(4,30)-(4,63)
(4,48)-(4,58)
(4,48)-(4,63)
*)
