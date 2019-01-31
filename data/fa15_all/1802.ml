
let fp f b = let (i,t) = f b in if i = b then b;;

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile ((fp f b), b);;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let xx = f b in if b = xx then (xx, false) else (xx, true) in
      g), b);;

*)

(* changed spans
(6,30)-(6,32)
let g =
  fun b ->
    (let xx = f b in
     if b = xx
     then (xx , false)
     else (xx , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(6,33)-(6,34)
fun b ->
  (let xx = f b in
   if b = xx
   then (xx , false)
   else (xx , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,33)-(6,34)
f b
AppG (fromList [VarG])

(6,33)-(6,34)
let xx = f b in
if b = xx
then (xx , false)
else (xx , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(6,39)-(6,40)
b = xx
BopG VarG VarG

(6,39)-(6,40)
if b = xx
then (xx , false)
else (xx , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

*)
