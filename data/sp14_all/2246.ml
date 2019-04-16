
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun (f,b)  -> if (f b) = b then b else f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(5,30)-(5,74)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
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
(5,22)-(5,28)
(5,22)-(5,78)
(5,29)-(5,78)
(5,30)-(5,74)
(5,45)-(5,73)
(5,70)-(5,71)
(5,70)-(5,73)
*)
