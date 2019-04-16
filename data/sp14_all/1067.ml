
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> ((f x), (not ((f x) = x)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f x) = x)))), b);;

*)

(* changed spans
(4,29)-(4,70)
(fun x ->
   (f x , not (f x = x)) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(4,22)-(4,28)
(4,22)-(4,70)
(4,29)-(4,70)
*)
