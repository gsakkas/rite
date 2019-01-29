
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> f x not ((f x) = x)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f x) = x)))), b);;

*)

(* changed spans
(4,40)-(4,41)
f x
AppG (fromList [VarG])

(4,40)-(4,59)
(f x , not (f x = x))
TupleG (fromList [AppG (fromList [EmptyG])])

(4,44)-(4,47)
not (f x = x)
AppG (fromList [BopG EmptyG EmptyG])

*)
