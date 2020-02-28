
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((let f' f b = (f b) = b in f'), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(5,38)-(5,53)
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(3,64)
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(5,22)-(5,28)
(5,22)-(5,64)
(5,29)-(5,64)
(5,30)-(5,60)
(5,38)-(5,53)
(5,40)-(5,53)
(5,57)-(5,59)
*)
