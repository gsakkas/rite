
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint x = ((f x) - x) < 0 in f b in wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(7,26)-(7,45)
fun s -> (f s - s) < 0
LamG (BopG EmptyG EmptyG)

(7,32)-(7,33)
s
VarG

(7,34)-(7,35)
(f x , isFPoint x)
TupleG (fromList [AppG (fromList [EmptyG])])

(7,39)-(7,40)
s
VarG

(7,49)-(7,50)
isFPoint
VarG

(7,49)-(7,50)
x
VarG

(7,49)-(7,50)
wwhile (gs , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(7,51)-(7,52)
x
VarG

*)
