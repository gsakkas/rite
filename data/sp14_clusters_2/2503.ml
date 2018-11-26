
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let k x = f x in ((b, (b != b)), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,28)-(7,65)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(7,35)-(7,42)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(7,39)-(7,42)
let xx = f x in (xx , xx <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(7,48)-(7,49)
xx
VarG

(7,52)-(7,53)
xx
VarG

(7,62)-(7,63)
g
VarG

*)
