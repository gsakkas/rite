
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let xx = (b * b) * b in ((xx, (xx < 100)), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,54)-(7,70)
f
VarG

(7,54)-(7,70)
x
VarG

(7,54)-(7,70)
fun x ->
  (let xx = f x in
   (xx , xx <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,54)-(7,70)
f x
AppG (fromList [VarG])

(7,54)-(7,70)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(7,54)-(7,70)
let xx = f x in (xx , xx <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(7,59)-(7,69)
xx <> b
BopG VarG VarG

*)
