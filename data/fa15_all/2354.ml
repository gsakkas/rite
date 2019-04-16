
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let q = f b in (q, (q != b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(5,22)-(5,64)
let f' =
  fun b' ->
    (f b' , f b' <> b') in
wwhile (f' , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,51)-(3,57)
(3,51)-(3,65)
(3,58)-(3,65)
(3,59)-(3,60)
(5,22)-(5,28)
(5,22)-(5,64)
(5,29)-(5,64)
(5,30)-(5,60)
(5,46)-(5,59)
*)
