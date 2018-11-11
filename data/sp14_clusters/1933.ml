
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b) then let f b = (b, true) in wwhile (f, (f b)) else b;;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(8,5)-(8,15)
b = f b
BopG VarG (AppG [EmptyG])

(8,21)-(8,61)
f b
AppG [VarG]

(8,27)-(8,40)
f
VarG

(8,27)-(8,40)
b
VarG

(8,27)-(8,40)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(8,32)-(8,33)
f
VarG

(8,32)-(8,33)
f b
AppG [VarG]

(8,52)-(8,53)
g
VarG

*)
