
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun f'  -> fun x  -> (f, ((f x) = x))), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x) = x)) in f'), b);;

*)

(* changed spans
(4,29)-(4,68)
let f' =
  fun x -> (f x , f x = x) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(4,52)-(4,53)
f x
AppG (fromList [VarG])

(4,55)-(4,66)
x
VarG

(4,70)-(4,71)
f'
VarG

*)
