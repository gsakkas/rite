
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let inc f' = f (f b) in inc f), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,30)-(5,61)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(3,3)-(3,59)
(3,16)-(3,17)
(3,16)-(3,19)
(3,45)-(3,51)
(3,45)-(3,59)
(3,52)-(3,59)
(3,53)-(3,54)
(3,56)-(3,58)
(5,22)-(5,28)
(5,22)-(5,65)
(5,29)-(5,65)
(5,30)-(5,61)
(5,39)-(5,51)
(5,44)-(5,45)
(5,44)-(5,51)
(5,46)-(5,51)
(5,47)-(5,48)
(5,49)-(5,50)
(5,55)-(5,58)
(5,55)-(5,60)
(5,63)-(5,64)
*)
