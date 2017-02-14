
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
(6,9)-(6,67)
(6,18)-(6,46)
(6,26)-(6,31)
(6,50)-(6,66)
(6,51)-(6,62)
(6,55)-(6,61)
*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,44)-(3,50)
(3,44)-(3,58)
(3,51)-(3,58)
(3,52)-(3,53)
(6,2)-(6,8)
(6,2)-(6,67)
(6,9)-(6,67)
(6,9)-(6,67)
(6,18)-(6,46)
(6,25)-(6,46)
(6,50)-(6,66)
(6,51)-(6,62)
(6,52)-(6,54)
*)
