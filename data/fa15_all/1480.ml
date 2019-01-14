
let rec fix t x = if x = (t x) then x else t x;;

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile ((fix b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(7,29)-(7,36)
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,29)-(7,36)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(7,29)-(7,36)
let t = f b in
if b = t
then (b , false)
else (t , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(7,30)-(7,33)
f
VarG

(7,38)-(7,39)
b = t
BopG VarG VarG

(7,38)-(7,39)
if b = t
then (b , false)
else (t , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

*)
