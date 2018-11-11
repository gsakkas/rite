
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> ((f x), (not ((f x) = x)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f x) = x)))), b);;

*)

(* changed spans
(4,28)-(4,69)
(fun x ->
   (f x , not (f x = x)) , b)
TupleG [LamG EmptyG,VarG]

(4,39)-(4,68)
(f x , not (f x = x))
TupleG [AppG [EmptyG],AppG [EmptyG]]

*)
