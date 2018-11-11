
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = wwhile (f, (if b = (f b) then b else b));;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,21)-(7,27)
let g = fun b -> (b , f b) in
wwhile (g , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(7,28)-(7,61)
fun b -> (b , f b)
LamG (TupleG [EmptyG,EmptyG])

(7,51)-(7,52)
wwhile (g , b)
AppG [TupleG [EmptyG,EmptyG]]

(7,58)-(7,59)
wwhile
VarG

(7,58)-(7,59)
g
VarG

(7,58)-(7,59)
(g , b)
TupleG [VarG,VarG]

*)
