
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> f x not ((f x) = x)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f x) = x)))), b);;

*)

(* changed spans
(4,40)-(4,41)
f x
AppG [VarG]

(4,40)-(4,59)
(f x , not (f x = x))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(4,44)-(4,47)
not (f x = x)
AppG [BopG EmptyG EmptyG]

*)
