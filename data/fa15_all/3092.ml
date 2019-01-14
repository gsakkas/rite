
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((not f x) = x)) in f'), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let f' x = ((f x), (not ((f x) = x))) in f'), b);;

*)

(* changed spans
(4,50)-(4,59)
not (f x = x)
AppG (fromList [BopG EmptyG EmptyG])

(4,55)-(4,56)
f x
AppG (fromList [VarG])

(4,55)-(4,56)
f x = x
BopG (AppG (fromList [EmptyG])) VarG

*)
