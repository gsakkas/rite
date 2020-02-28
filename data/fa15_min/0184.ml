
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


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
AppG [TupleG [EmptyG,EmptyG]]

(3,47)-(3,60)
x
VarG

(5,29)-(5,49)
let g =
  fun b ->
    (f b , if f b = b
           then false
           else true) in
(g , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,3)-(3,60)
(3,15)-(3,16)
(3,15)-(3,18)
(3,22)-(3,60)
(3,40)-(3,41)
(3,47)-(3,53)
(3,47)-(3,60)
(3,54)-(3,60)
(3,55)-(3,56)
(5,22)-(5,28)
(5,22)-(5,49)
(5,29)-(5,49)
(5,30)-(5,45)
(5,31)-(5,37)
*)
