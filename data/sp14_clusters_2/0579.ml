
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) = wwhile (fun y  -> fun x  -> (((f x), ((f x) != b)), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(6,28)-(6,76)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,50)-(6,71)
let xx = f x in (xx , xx <> x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(6,58)-(6,70)
xx
VarG

(6,58)-(6,70)
(xx , xx <> x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,60)-(6,61)
xx
VarG

(6,68)-(6,69)
(y , b)
TupleG (fromList [VarG])

(6,73)-(6,74)
y
VarG

*)
