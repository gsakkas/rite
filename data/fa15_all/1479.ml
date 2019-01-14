
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (if (wwhile (f, b)) = b then b else ((wwhile (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(6,22)-(6,23)
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,22)-(6,23)
f b
AppG (fromList [VarG])

(6,22)-(6,23)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(6,22)-(6,23)
let t = f b in
if b = t
then (b , false)
else (t , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(6,31)-(6,32)
if b = t
then (b , false)
else (t , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,38)-(6,39)
b = t
BopG VarG VarG

(6,47)-(6,53)
t
VarG

(6,63)-(6,64)
t
VarG

(6,63)-(6,64)
g
VarG

(6,63)-(6,64)
false
LitG

(6,63)-(6,64)
true
LitG

(6,63)-(6,64)
(t , true)
TupleG (fromList [VarG,LitG])

*)
