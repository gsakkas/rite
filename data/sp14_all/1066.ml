
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b = ((f b), ((not f b) = b)) in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b = ((f b), (not ((f b) = b))) in wwhile (fx, b);;

*)

(* changed spans
(4,41)-(4,50)
not (f b = b)
AppG (fromList [BopG EmptyG EmptyG])

(4,46)-(4,47)
f b
AppG (fromList [VarG])

(4,46)-(4,47)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

*)
