
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let isFPoint s = ((f s) - s) < 0 in
  let iterate (t,y) = t y in
  let rec go r = if isFPoint r then r else go (iterate (f, r)) in
  wwhile (go, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(4,53)-(4,54)
fun x ->
  (let isFPoint =
     fun s -> (f s - s) < 0 in
   (f x , isFPoint x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,53)-(4,54)
let gs =
  fun x ->
    (let isFPoint =
       fun s -> (f s - s) < 0 in
     (f x , isFPoint x)) in
wwhile (gs , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(8,15)-(8,25)
(f x , isFPoint x)
TupleG (fromList [AppG (fromList [EmptyG])])

(9,2)-(10,16)
x
VarG

(9,17)-(9,62)
f
VarG

(9,59)-(9,60)
x
VarG

(10,10)-(10,12)
gs
VarG

*)
