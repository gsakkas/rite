
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x not) = x)) in f'), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let f' x = ((f x), (not ((f x) = x))) in f'), b);;

*)

(* changed spans
(4,49)-(4,64)
not
VarG

(4,49)-(4,64)
not (f x = x)
AppG (fromList [BopG EmptyG EmptyG])

(4,50)-(4,59)
f x
AppG (fromList [VarG])

*)
