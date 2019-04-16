
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (if (f b) = b then (f, b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,29)-(6,55)
(fun b -> (f b , f b = b) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(6,29)-(6,55)
(6,48)-(6,54)
(6,54)-(6,54)
*)
