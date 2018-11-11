
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = if b != (f b) then wwhile (f, (f b)) else b;;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(7,24)-(7,34)
b = f b
BopG VarG (AppG [EmptyG])

(7,51)-(7,56)
b
VarG

(7,51)-(7,56)
fun b -> (f b , true)
LamG (TupleG [EmptyG,EmptyG])

(7,51)-(7,56)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(7,51)-(7,56)
(f b , true)
TupleG [AppG [EmptyG],LitG]

(7,63)-(7,64)
wwhile
VarG

(7,63)-(7,64)
g
VarG

(7,63)-(7,64)
f
VarG

(7,63)-(7,64)
wwhile (g , f b)
AppG [TupleG [EmptyG,EmptyG]]

(7,63)-(7,64)
f b
AppG [VarG]

(7,63)-(7,64)
true
LitG

(7,63)-(7,64)
(g , f b)
TupleG [VarG,AppG [EmptyG]]

*)
