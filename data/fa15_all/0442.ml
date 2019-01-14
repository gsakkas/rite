
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let gs x = (x, (((f x) - x) >= 0)) in wwhile ((f gs), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let gs x = ((f x), (((f x) - x) >= 0)) in wwhile (gs, b);;

*)

(* changed spans
(6,21)-(6,77)
f
VarG

(6,21)-(6,77)
f x
AppG (fromList [VarG])

*)
