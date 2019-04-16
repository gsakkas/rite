
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((let b' = f b in if b != b' then true else false), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(6,3)-(6,64)
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
(6,3)-(6,9)
(6,3)-(6,64)
(6,10)-(6,64)
(6,11)-(6,60)
(6,28)-(6,59)
(6,54)-(6,59)
*)
