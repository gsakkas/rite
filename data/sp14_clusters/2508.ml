
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let g x = (f x) = x in ((g b), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,28)-(7,63)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
TupleG [LetG NonRec [EmptyG] EmptyG,VarG]

(7,39)-(7,48)
let xx = f x in (xx , xx <> b)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(7,54)-(7,55)
xx
VarG

(7,56)-(7,57)
xx
VarG

(7,56)-(7,57)
xx <> b
BopG VarG VarG

(7,60)-(7,61)
g
VarG

*)
