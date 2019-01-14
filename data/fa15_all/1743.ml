
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((let f' b = ((f b), (((f b) not) = b)) in f'), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), ((f b) != b)) in f'), b);;

*)

(* changed spans
(6,31)-(6,42)
f b <> b
BopG (AppG (fromList [EmptyG])) VarG

*)
