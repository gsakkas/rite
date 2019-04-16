
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then false else true in wwhile ((f1 f), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then (false, x) else (true, (f2 x)) in
  wwhile ((f1 f), b);;

*)

(* changed spans
(6,36)-(6,41)
(false , x)
TupleG (fromList [VarG,LitG])

(6,47)-(6,51)
(true , f2 x)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(3,3)-(3,64)
(3,17)-(3,18)
(3,17)-(3,20)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(6,3)-(6,73)
(6,10)-(6,51)
(6,13)-(6,51)
(6,17)-(6,51)
(6,47)-(6,51)
(6,55)-(6,61)
(6,55)-(6,73)
(6,62)-(6,73)
(6,63)-(6,69)
(6,64)-(6,66)
*)
