
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let b' = (b, ((f b) = b)) in wwhile (f, b');;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), (b = (f b))) in wwhile (f, b);;

*)

(* changed spans
(4,22)-(4,65)
let f =
  fun b -> (f b , b = f b) in
wwhile (f , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(2,67)-(2,69)
(4,22)-(4,65)
(4,31)-(4,47)
(4,32)-(4,33)
(4,35)-(4,46)
(4,36)-(4,41)
(4,37)-(4,38)
(4,44)-(4,45)
(4,51)-(4,57)
(4,51)-(4,65)
(4,58)-(4,65)
(4,59)-(4,60)
(4,62)-(4,64)
*)
