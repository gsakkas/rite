
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
(6,54)-(6,60)
(6,63)-(6,64)
*)

(* type error slice
(3,24)-(3,25)
(3,24)-(3,27)
(3,61)-(3,67)
(3,61)-(3,77)
(3,69)-(3,70)
(3,69)-(3,77)
(6,3)-(6,9)
(6,3)-(6,64)
(6,12)-(6,60)
(6,12)-(6,60)
(6,12)-(6,64)
(6,21)-(6,48)
(6,32)-(6,48)
(6,54)-(6,58)
(6,54)-(6,60)
*)
