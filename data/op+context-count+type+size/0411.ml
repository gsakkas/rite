
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun (f,b)  -> if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(6,12)-(6,72)
(6,26)-(6,72)
(6,30)-(6,33)
(6,30)-(6,38)
(6,37)-(6,38)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,19)-(3,20)
(3,60)-(3,66)
(3,60)-(3,73)
(3,68)-(3,69)
(3,68)-(3,73)
(3,71)-(3,73)
(6,3)-(6,9)
(6,3)-(6,77)
(6,12)-(6,72)
(6,12)-(6,77)
(6,26)-(6,72)
(6,30)-(6,31)
(6,30)-(6,33)
(6,32)-(6,33)
(6,45)-(6,46)
(6,45)-(6,53)
(6,48)-(6,53)
(6,62)-(6,63)
(6,62)-(6,65)
(6,64)-(6,65)
(6,76)-(6,77)
*)
