
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
(6,10)-(6,73)
(6,25)-(6,72)
(6,28)-(6,33)
(6,28)-(6,37)
(6,36)-(6,37)
*)

(* type error slice
(2,3)-(3,75)
(2,16)-(3,73)
(3,2)-(3,73)
(3,16)-(3,17)
(3,16)-(3,19)
(3,18)-(3,19)
(3,59)-(3,65)
(3,59)-(3,73)
(3,66)-(3,73)
(3,70)-(3,72)
(6,2)-(6,8)
(6,2)-(6,77)
(6,9)-(6,77)
(6,10)-(6,73)
(6,25)-(6,72)
(6,43)-(6,53)
(6,44)-(6,45)
*)
