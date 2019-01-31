
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = (f, ((f x) = x)) in (h, b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = ((f x), ((f x) != x)) in (h, b));;

*)

(* changed spans
(4,40)-(4,41)
f x
AppG (fromList [VarG])

(4,43)-(4,54)
x
VarG

(4,44)-(4,49)
f x <> x
BopG (AppG (fromList [EmptyG])) VarG

*)
