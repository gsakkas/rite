
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (f, true, b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,29)-(6,41)
(fun x ->
   (f x , x <> f x) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(4,52)-(4,58)
(4,52)-(4,66)
(4,59)-(4,66)
(6,22)-(6,28)
(6,22)-(6,41)
(6,29)-(6,41)
*)
