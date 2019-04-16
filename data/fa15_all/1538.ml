
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b' = if (f b') = b then b else f b' in f' b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(6,19)-(6,54)
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

(6,58)-(6,62)
f'
VarG

*)

(* type error slice
(3,3)-(3,64)
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(3,53)-(3,55)
(6,3)-(6,9)
(6,3)-(6,67)
(6,10)-(6,67)
(6,11)-(6,63)
(6,19)-(6,54)
(6,24)-(6,54)
(6,27)-(6,33)
(6,27)-(6,37)
(6,28)-(6,29)
(6,36)-(6,37)
(6,50)-(6,51)
(6,50)-(6,54)
(6,58)-(6,60)
(6,58)-(6,62)
(6,65)-(6,66)
*)
