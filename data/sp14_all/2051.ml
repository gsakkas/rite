
let rec wwhile (f,b) = let (b',c') = f b in if c' then f b' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,56)-(2,60)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,24)-(2,68)
(2,38)-(2,39)
(2,38)-(2,41)
(2,45)-(2,68)
(2,56)-(2,57)
(2,56)-(2,60)
(2,66)-(2,68)
*)
