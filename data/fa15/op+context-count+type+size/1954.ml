
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let f' (f,b) = ((f b), (b = (f b))) in ((f' (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,11)-(6,65)
(6,19)-(6,43)
(6,28)-(6,31)
(6,52)-(6,60)
(6,52)-(6,65)
(6,56)-(6,60)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,45)-(3,51)
(3,45)-(3,58)
(3,53)-(3,54)
(3,53)-(3,58)
(6,3)-(6,9)
(6,3)-(6,65)
(6,11)-(6,65)
(6,11)-(6,65)
(6,19)-(6,43)
(6,28)-(6,43)
(6,52)-(6,54)
(6,52)-(6,60)
(6,52)-(6,65)
*)
