
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun f  -> b = (f b)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,29)-(4,50)
fun y -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(4,40)-(4,49)
f
VarG

(4,40)-(4,49)
b
VarG

(4,40)-(4,49)
f b
AppG (fromList [VarG])

(4,40)-(4,49)
(f b , b = f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)
