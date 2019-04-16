
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile b' c' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,56)-(2,68)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,78)
(2,17)-(2,76)
(2,24)-(2,76)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,68)
(2,63)-(2,65)
*)
