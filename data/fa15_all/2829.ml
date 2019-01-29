
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = ((wwhile (fun b  -> ((f b), (b != (f b))))), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), (b != (f b)))), b);;

*)

(* changed spans
(6,30)-(6,63)
(fun b ->
   (f b , b <> f b) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)
