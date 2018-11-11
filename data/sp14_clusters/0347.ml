
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (let xx = (b * b) * b in ((xx, (xx < 100)), b));;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,28)-(6,75)
fun x ->
  (let xx = f b in
   (xx , xx = b))
LamG (LetG NonRec [EmptyG] EmptyG)

(6,28)-(6,75)
let d =
  fun x ->
    (let xx = f b in
     (xx , xx = b)) in
d
LetG NonRec [LamG EmptyG] VarG

(6,28)-(6,75)
(let d =
   fun x ->
     (let xx = f b in
      (xx , xx = b)) in
 d , b)
TupleG [LetG NonRec [EmptyG] EmptyG,VarG]

(6,43)-(6,44)
f b
AppG [VarG]

(6,48)-(6,49)
f
VarG

(6,59)-(6,69)
xx = b
BopG VarG VarG

*)
