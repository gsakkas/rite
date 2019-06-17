
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let f' b = ((f b), (b = (f b))) in ((f' (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,10)-(6,63)
(let f' =
   fun b -> (f b , b = f b) in
 f' , b)
TupleG [LetG NonRec [(EmptyPatG,EmptyG)] EmptyG,VarG]

*)

(* type error slice
(6,10)-(6,63)
(6,18)-(6,42)
(6,35)-(6,40)
(6,36)-(6,37)
(6,38)-(6,39)
(6,47)-(6,58)
(6,48)-(6,50)
(6,51)-(6,57)
(6,52)-(6,53)
*)
