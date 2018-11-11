
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b = ((f b), ((not f b) = b)) in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b = ((f b), (not ((f b) = b))) in wwhile (fx, b);;

*)

(* changed spans
(4,41)-(4,50)
not (f b = b)
AppG [BopG EmptyG EmptyG]

(4,46)-(4,47)
f b
AppG [VarG]

(4,46)-(4,47)
f b = b
BopG (AppG [EmptyG]) VarG

*)
