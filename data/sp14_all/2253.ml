
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((fun (f,b)  -> match f b with | b -> ((f b), false) | _ -> ((f b), true)),
      b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(7,6)-(7,79)
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
(6,3)-(8,9)
(7,5)-(8,9)
(7,6)-(7,79)
(7,21)-(7,78)
(7,43)-(7,57)
(7,44)-(7,49)
(7,45)-(7,46)
*)
