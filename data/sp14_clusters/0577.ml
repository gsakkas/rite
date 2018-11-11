
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile
    (fun y  ->
       fun x  -> let z = f x in if z = b then (x, true) else ((y z), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(8,4)-(9,72)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(9,17)-(9,71)
let xx = f x in (xx , xx <> x)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(9,47)-(9,48)
xx
VarG

(9,47)-(9,48)
xx
VarG

(9,47)-(9,48)
xx <> x
BopG VarG VarG

*)
