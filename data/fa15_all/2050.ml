
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' f b = ((f b), (b = (f b))) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), ((f b) = b)) in wwhile (f, b);;

*)

(* changed spans
(4,28)-(4,54)
let f =
  fun b -> (f b , f b = b) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,58)-(4,72)
b
VarG

(4,66)-(4,68)
f
VarG

*)
