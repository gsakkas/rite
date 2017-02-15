
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f b), ((f b) = b)) in func b), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f b), ((f b) = b)) in func), b);;

*)

(* changed spans
(6,53)-(6,59)
(6,62)-(6,63)
*)

(* type error slice
(3,23)-(3,24)
(3,23)-(3,26)
(3,60)-(3,66)
(3,60)-(3,77)
(3,67)-(3,77)
(3,68)-(3,69)
(6,2)-(6,8)
(6,2)-(6,64)
(6,9)-(6,64)
(6,10)-(6,60)
(6,10)-(6,60)
(6,20)-(6,49)
(6,29)-(6,49)
(6,53)-(6,57)
(6,53)-(6,59)
*)
