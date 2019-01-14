
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let xx = f x in
    match xx with | xx when (xx - x) > 0 -> (x, b) | _ -> ((f x), b) in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let xx = f x in (xx, (xx = x)) in wwhile (gs, b);;

*)

(* changed spans
(9,34)-(9,35)
xx
VarG

(9,34)-(9,35)
xx = x
BopG VarG VarG

(9,60)-(9,61)
xx
VarG

*)
