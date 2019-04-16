
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' x = let b' = f b in (b', (b' = b)) in f' b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' x = let b' = f b in (b', (b' = b)) in f'), b);;

*)

(* changed spans
(6,57)-(6,61)
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
(6,3)-(6,66)
(6,10)-(6,66)
(6,11)-(6,62)
(6,19)-(6,53)
(6,23)-(6,53)
(6,39)-(6,53)
(6,57)-(6,59)
(6,57)-(6,61)
*)
