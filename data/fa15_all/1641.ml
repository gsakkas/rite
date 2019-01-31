
let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let y = f b in match y with | b -> (y, false) | _ -> (y, true)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(8,5)-(8,69)
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(8,5)-(8,69)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec (fromList [LamG EmptyG]) VarG

(8,21)-(8,68)
x
VarG

(8,27)-(8,28)
y = x
BopG VarG VarG

(8,27)-(8,28)
if y = x
then (y , false)
else (y , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(8,41)-(8,51)
x
VarG

(8,71)-(8,72)
helper
VarG

*)
