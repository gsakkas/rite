
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> (f, (b = (f b)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (not (b = (f b))))), b);;

*)

(* changed spans
(4,41)-(4,42)
f b
AppG (fromList [VarG])

(4,44)-(4,55)
b
VarG

(4,44)-(4,55)
not
VarG

(4,44)-(4,55)
not (b = f b)
AppG (fromList [BopG EmptyG EmptyG])

*)
