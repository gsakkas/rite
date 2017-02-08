
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun (f,b)  -> if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(6,12)-(6,72)
*)

(* type error slice
(2,4)-(3,76)
(2,17)-(3,73)
(3,3)-(3,73)
(3,17)-(3,18)
(3,17)-(3,20)
(3,19)-(3,20)
(3,60)-(3,66)
(3,60)-(3,73)
(3,68)-(3,73)
(3,71)-(3,73)
(6,3)-(6,9)
(6,3)-(6,77)
(6,12)-(6,72)
(6,12)-(6,77)
(6,26)-(6,72)
(6,45)-(6,46)
(6,45)-(6,53)
*)
