
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (if (f b) = b then (b, false) else (((f b), true), b));;


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
(6,10)-(6,64)
(6,29)-(6,39)
(6,30)-(6,31)
(6,33)-(6,38)
(6,45)-(6,63)
(6,46)-(6,59)
(6,61)-(6,62)
*)
