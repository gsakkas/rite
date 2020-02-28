
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,30)-(5,45)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(3,3)-(3,59)
(3,16)-(3,17)
(3,16)-(3,19)
(3,23)-(3,59)
(3,37)-(3,39)
(3,45)-(3,51)
(3,45)-(3,59)
(3,52)-(3,59)
(3,53)-(3,54)
(5,22)-(5,28)
(5,22)-(5,49)
(5,29)-(5,49)
(5,30)-(5,45)
(5,31)-(5,37)
*)
