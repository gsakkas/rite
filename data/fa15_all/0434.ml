
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((funt f b), ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,21)-(7,25)
f b
AppG (fromList [VarG])

*)
