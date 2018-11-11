
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) = wwhile ((fun y  -> fun x  -> ((f x), ((f x) != b))), b);;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(6,29)-(6,72)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(6,50)-(6,71)
let xx = f x in (xx , xx <> x)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(6,58)-(6,70)
xx
VarG

(6,58)-(6,70)
(xx , xx <> x)
TupleG [VarG,BopG EmptyG EmptyG]

(6,60)-(6,61)
xx
VarG

(6,68)-(6,69)
(y , b)
TupleG [VarG,VarG]

(6,74)-(6,75)
y
VarG

*)
