
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b' = f b in ((f, (b' = b)), b));;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(2,77)
(2,23)-(2,77)
(4,28)-(4,64)
(4,38)-(4,39)
(4,38)-(4,41)
(4,40)-(4,41)
(4,46)-(4,59)
(4,47)-(4,48)
(4,50)-(4,58)
(4,51)-(4,53)
(4,56)-(4,57)
(4,61)-(4,62)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(4,21)-(4,27)
(4,21)-(4,64)
(4,28)-(4,64)
(4,45)-(4,63)
(4,46)-(4,59)
*)
