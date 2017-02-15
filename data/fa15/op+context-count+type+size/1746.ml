
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
(6,9)-(6,66)
(6,18)-(6,45)
(6,26)-(6,31)
(6,49)-(6,65)
(6,50)-(6,61)
(6,54)-(6,60)
*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,44)-(3,50)
(3,44)-(3,58)
(3,51)-(3,58)
(3,52)-(3,53)
(6,2)-(6,8)
(6,2)-(6,66)
(6,9)-(6,66)
(6,9)-(6,66)
(6,18)-(6,45)
(6,25)-(6,45)
(6,49)-(6,65)
(6,50)-(6,61)
(6,51)-(6,53)
*)
