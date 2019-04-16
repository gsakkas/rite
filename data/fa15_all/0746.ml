
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile f b' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b) else b';;

*)

(* changed spans
(2,56)-(2,67)
wwhile (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,77)
(2,17)-(2,75)
(2,56)-(2,62)
(2,56)-(2,67)
(2,63)-(2,64)
*)
