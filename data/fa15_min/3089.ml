
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun f'  -> fun x  -> (f, ((f x) = x))), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x) = x)) in f'), b);;

*)

(* changed spans
(4,30)-(4,69)
let f' =
  fun x -> (f x , f x = x) in
f'
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(4,22)-(4,28)
(4,22)-(4,73)
(4,29)-(4,73)
(4,30)-(4,69)
(4,42)-(4,68)
*)
