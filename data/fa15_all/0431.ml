
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = b in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(6,14)-(6,55)
f
VarG

(6,14)-(6,55)
f b
AppG (fromList [VarG])

(6,14)-(6,55)
(f b , f b = b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(6,21)-(6,55)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(6,30)-(6,35)
f
VarG

(6,30)-(6,35)
b
VarG

(6,30)-(6,35)
b
VarG

(6,30)-(6,35)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
