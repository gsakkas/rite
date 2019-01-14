
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,29)-(5,44)
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,29)-(5,44)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,29)-(5,44)
let t = f b in
if b = t
then (b , false)
else (t , true)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(5,46)-(5,47)
b = t
BopG VarG VarG

(5,46)-(5,47)
if b = t
then (b , false)
else (t , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

*)
