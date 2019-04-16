
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> (f, (b = (f b)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (not (b = (f b))))), b);;

*)

(* changed spans
(4,42)-(4,43)
f b
AppG (fromList [VarG])

(4,45)-(4,56)
not (b = f b)
AppG (fromList [BopG EmptyG EmptyG])

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
(4,22)-(4,28)
(4,22)-(4,62)
(4,29)-(4,62)
(4,30)-(4,58)
(4,41)-(4,57)
(4,42)-(4,43)
(4,50)-(4,55)
(4,51)-(4,52)
(4,53)-(4,54)
(4,60)-(4,61)
*)
