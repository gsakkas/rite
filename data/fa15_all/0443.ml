
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let xx = f x in match xx with | _ when (xx - x) > 0 -> x | _ -> f x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let xx = f x in (xx, (xx = x)) in wwhile (gs, b);;

*)

(* changed spans
(8,20)-(8,71)
(xx , xx = x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(8,43)-(8,55)
xx
VarG

(8,68)-(8,69)
xx = x
BopG VarG VarG

*)
