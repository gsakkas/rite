
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f b') else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,64)-(2,68)
*)

(* type error slice
(2,4)-(2,79)
(2,17)-(2,77)
(2,24)-(2,77)
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,45)-(2,77)
(2,56)-(2,62)
(2,56)-(2,68)
(2,64)-(2,65)
(2,64)-(2,68)
(2,66)-(2,68)
*)
