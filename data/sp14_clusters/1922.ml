
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = x in wwhile (f, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,31)-(7,32)
let g = fun b -> (b , f b) in
wwhile (g , b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(7,36)-(7,42)
f
VarG

(7,36)-(7,42)
b
VarG

(7,36)-(7,42)
wwhile (g , b)
AppG [TupleG [EmptyG,EmptyG]]

(7,36)-(7,49)
b
VarG

(7,36)-(7,49)
fun b -> (b , f b)
LamG (TupleG [EmptyG,EmptyG])

(7,36)-(7,49)
(b , f b)
TupleG [VarG,AppG [EmptyG]]

(7,44)-(7,45)
g
VarG

*)
