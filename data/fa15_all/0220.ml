
let fu x b = (x, (b < (x b)));;

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile ((fu f b), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(8,30)-(8,32)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(8,33)-(8,34)
fun x ->
  (let ff = f b in
   (ff , b = ff))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(8,33)-(8,34)
f b
AppG (fromList [VarG])

(8,33)-(8,34)
let ff = f b in (ff , b = ff)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(8,39)-(8,40)
ff
VarG

(8,39)-(8,40)
b = ff
BopG VarG VarG

(8,39)-(8,40)
(ff , b = ff)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
