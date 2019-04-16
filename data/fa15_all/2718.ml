
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> b = (f b)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,41)-(4,50)
(f b , b = f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(2,24)-(2,73)
(2,36)-(2,37)
(2,36)-(2,39)
(2,53)-(2,59)
(2,53)-(2,66)
(2,60)-(2,66)
(2,61)-(2,62)
(4,22)-(4,28)
(4,22)-(4,55)
(4,29)-(4,55)
(4,30)-(4,51)
(4,41)-(4,50)
*)
