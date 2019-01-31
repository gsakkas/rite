
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if f = true then b else ((wwhile (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,28)-(5,74)
f
VarG

(5,28)-(5,74)
b
VarG

(5,28)-(5,74)
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,28)-(5,74)
f b
AppG (fromList [VarG])

(5,28)-(5,74)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,28)-(5,74)
let t = f b in
if b = t
then (b , false)
else (t , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(5,28)-(5,74)
(let g =
   fun b ->
     (let t = f b in
      if b = t
      then (b , false)
      else (t , true)) in
 g , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(5,55)-(5,61)
t
VarG

(5,71)-(5,72)
t
VarG

(5,71)-(5,72)
g
VarG

(5,71)-(5,72)
false
LitG

(5,71)-(5,72)
true
LitG

(5,71)-(5,72)
(t , true)
TupleG (fromList [VarG,LitG])

*)
