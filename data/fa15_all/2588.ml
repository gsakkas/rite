
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile ((fun x  -> ((wwhile (f, b)), (not (b = (f b))))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(5,23)-(5,38)
f b
AppG (fromList [VarG])

(5,40)-(5,57)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

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
(5,23)-(5,38)
(5,24)-(5,30)
(5,31)-(5,37)
(5,32)-(5,33)
(5,35)-(5,36)
(5,45)-(5,56)
(5,46)-(5,47)
(5,50)-(5,55)
(5,51)-(5,52)
*)
