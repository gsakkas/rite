
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((match b with | b' -> if b = b' then (b, false) else (b, true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((fun b'  -> if (f b') = b' then ((f b'), false) else ((f b'), true)), b);;

*)

(* changed spans
(6,11)-(6,74)
fun b' ->
  if f b' = b'
  then (f b' , false)
  else (f b' , true)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(6,3)-(6,9)
(6,3)-(6,78)
(6,10)-(6,78)
(6,11)-(6,74)
(6,33)-(6,73)
(6,64)-(6,73)
*)
