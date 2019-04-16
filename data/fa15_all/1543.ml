
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b' = if (f b) = b then (b, true) else ((f b), false) in f' b),
      b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(7,14)-(7,66)
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

(7,70)-(7,74)
f'
VarG

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(6,3)-(6,9)
(6,3)-(8,9)
(7,5)-(8,9)
(7,6)-(7,75)
(7,14)-(7,66)
(7,19)-(7,66)
(7,52)-(7,66)
(7,70)-(7,72)
(7,70)-(7,74)
*)
