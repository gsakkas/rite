
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' = if (f b) = b then (b, true) else (b, false) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b' = if (f b') = b' then (b', true) else (b', false) in
  wwhile (f', b);;

*)

(* changed spans
(6,12)-(6,55)
fun b' ->
  if f b' = b'
  then (b' , true)
  else (b' , false)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(6,3)-(6,73)
(6,12)-(6,55)
(6,45)-(6,55)
(6,59)-(6,65)
(6,59)-(6,73)
(6,66)-(6,73)
(6,67)-(6,69)
*)
