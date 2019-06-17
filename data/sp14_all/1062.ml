
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f b), ((f b) = b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b' = ((f b'), ((f b') = b')) in wwhile (fx, b);;

*)

(* changed spans
(4,22)-(4,52)
let fx =
  fun b' ->
    (f b' , f b' = b') in
wwhile (fx , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(4,22)-(4,28)
(4,22)-(4,52)
(4,29)-(4,52)
*)
