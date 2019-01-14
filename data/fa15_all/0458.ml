
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint x = ((f x) - x) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in go x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(8,17)-(8,36)
fun s -> (f s - s) < 0
LamG (BopG EmptyG EmptyG)

(8,23)-(8,24)
s
VarG

(8,30)-(8,31)
s
VarG

(10,48)-(10,64)
f
VarG

(10,48)-(10,64)
f x
AppG (fromList [VarG])

(10,68)-(10,70)
isFPoint
VarG

*)
