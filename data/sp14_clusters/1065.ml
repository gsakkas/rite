
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx = ((f b), ((f b) = b)) in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b = ((f b), ((f b) = b)) in wwhile (fx, b);;

*)

(* changed spans
(4,30)-(4,50)
fun b -> (f b , f b = b)
LamG (TupleG [EmptyG,EmptyG])

*)
