
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
(6,11)-(6,74)
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
(6,3)-(6,78)
(6,10)-(6,78)
(6,11)-(6,74)
(6,26)-(6,73)
(6,60)-(6,73)
(6,61)-(6,66)
(6,62)-(6,63)
*)
