
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
(7,6)-(7,73)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(3,76)
(2,17)-(3,74)
(3,3)-(3,74)
(3,17)-(3,18)
(3,17)-(3,20)
(3,19)-(3,20)
(3,60)-(3,66)
(3,60)-(3,74)
(3,67)-(3,74)
(3,71)-(3,73)
(6,3)-(6,9)
(6,3)-(7,77)
(7,5)-(7,77)
(7,6)-(7,73)
(7,21)-(7,72)
(7,59)-(7,72)
(7,60)-(7,65)
(7,61)-(7,62)
*)
