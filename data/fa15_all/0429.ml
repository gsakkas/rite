
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt x = let xx = f f (f (f b)) in (xx, ((f b) = b)) in
  wwhile (funt, (f b));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt x = let xx = f (f (f (f b))) in (xx, ((f b) = b)) in
  wwhile (funt, (f b));;

*)

(* changed spans
(7,15)-(7,58)
f (f (f b))
AppG (fromList [AppG (fromList [EmptyG])])

(7,24)-(7,37)
f (f (f (f b)))
AppG (fromList [AppG (fromList [EmptyG])])

*)
