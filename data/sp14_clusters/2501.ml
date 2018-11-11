
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile ((let k x = f x in (b, ((k b) != b))), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,29)-(7,65)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
g
LetG NonRec [LamG EmptyG] VarG

(7,40)-(7,43)
let xx = f x in (xx , xx <> b)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(7,48)-(7,49)
xx
VarG

(7,55)-(7,56)
xx
VarG

(7,67)-(7,68)
g
VarG

*)
