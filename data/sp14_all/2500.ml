
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile ((let k x = (f x) = x in f b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,29)-(7,57)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(7,40)-(7,49)
let xx = f x in (xx , xx <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(7,53)-(7,54)
(xx , xx <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(7,55)-(7,56)
xx
VarG

(7,55)-(7,56)
xx
VarG

(7,55)-(7,56)
xx <> b
BopG VarG VarG

(7,59)-(7,60)
g
VarG

*)
