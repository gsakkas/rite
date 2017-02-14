
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((fun (f,b)  -> if (f b) = b then ((f b), false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(7,7)-(7,71)
(7,21)-(7,71)
(7,25)-(7,28)
(7,25)-(7,33)
(7,32)-(7,33)
(7,41)-(7,42)
(7,41)-(7,44)
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
(6,3)-(7,76)
(7,7)-(7,71)
(7,7)-(7,76)
(7,21)-(7,71)
(7,41)-(7,42)
(7,41)-(7,44)
(7,41)-(7,52)
*)
