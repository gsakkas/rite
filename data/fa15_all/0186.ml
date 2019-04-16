
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g b = ((f b), (if (f b) = b then false else true)) in (g, b));;

*)

(* changed spans
(3,25)-(3,34)
y
VarG

(3,40)-(3,41)
wwhile (f , x)
AppG (fromList [TupleG (fromList [EmptyG])])

(3,47)-(3,60)
x
VarG

(6,10)-(6,64)
let g =
  fun b ->
    (f b , if f b = b
           then false
           else true) in
(g , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,47)-(3,53)
(3,47)-(3,60)
(3,54)-(3,60)
(3,55)-(3,56)
(6,3)-(6,9)
(6,3)-(6,64)
(6,10)-(6,64)
(6,11)-(6,60)
(6,46)-(6,59)
*)
