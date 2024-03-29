
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f, (b != (f b))), b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,30)-(6,47)
fun x -> (f x , x <> f x)
LamG VarPatG (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(4,52)-(4,58)
(4,52)-(4,66)
(4,59)-(4,66)
(4,60)-(4,61)
(6,22)-(6,28)
(6,22)-(6,51)
(6,29)-(6,51)
(6,30)-(6,47)
*)
