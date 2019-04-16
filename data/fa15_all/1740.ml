
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let f' (f,b) = ((f b), (b == (f b))) in ((f' (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,10)-(6,68)
(let f' =
   fun b -> (f b , b = f b) in
 f' , b)
TupleG (fromList [VarG,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG])

*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,45)-(3,51)
(3,45)-(3,59)
(3,52)-(3,59)
(3,53)-(3,54)
(6,3)-(6,9)
(6,3)-(6,68)
(6,10)-(6,68)
(6,19)-(6,47)
(6,26)-(6,47)
(6,51)-(6,67)
(6,52)-(6,63)
(6,53)-(6,55)
*)
