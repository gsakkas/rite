
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = wwhile ((let f b = b in b), b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,29)-(7,47)
let g = fun b -> (b , f b) in
wwhile (g , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(7,40)-(7,41)
(b , f b)
TupleG [VarG,AppG [EmptyG]]

(7,45)-(7,46)
f
VarG

(7,45)-(7,46)
f b
AppG [VarG]

(7,49)-(7,50)
wwhile
VarG

(7,49)-(7,50)
g
VarG

(7,49)-(7,50)
wwhile (g , b)
AppG [TupleG [EmptyG,EmptyG]]

(7,49)-(7,50)
(g , b)
TupleG [VarG,VarG]

*)
