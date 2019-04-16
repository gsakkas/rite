
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
(6,31)-(6,48)
f b <> b
BopG (AppG (fromList [EmptyG])) VarG

*)

(* type error slice
(2,4)-(3,61)
(2,17)-(3,59)
(3,3)-(3,59)
(3,16)-(3,17)
(3,16)-(3,19)
(3,18)-(3,19)
(3,45)-(3,51)
(3,45)-(3,59)
(3,52)-(3,59)
(3,56)-(3,58)
(6,3)-(6,9)
(6,3)-(6,60)
(6,10)-(6,60)
(6,11)-(6,56)
(6,19)-(6,49)
(6,23)-(6,49)
(6,24)-(6,29)
(6,25)-(6,26)
(6,31)-(6,48)
(6,32)-(6,43)
(6,33)-(6,38)
(6,34)-(6,35)
(6,46)-(6,47)
(6,53)-(6,55)
*)
