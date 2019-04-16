
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((wwhile (f, b)), (b = (f b)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,42)-(4,57)
f b
AppG (fromList [VarG])

*)

(* type error slice
(2,24)-(2,73)
(2,36)-(2,37)
(2,36)-(2,39)
(2,53)-(2,59)
(2,53)-(2,66)
(2,60)-(2,66)
(2,61)-(2,62)
(2,64)-(2,65)
(4,42)-(4,57)
(4,43)-(4,49)
(4,50)-(4,56)
(4,51)-(4,52)
(4,54)-(4,55)
(4,59)-(4,70)
(4,60)-(4,61)
(4,64)-(4,69)
(4,65)-(4,66)
*)
