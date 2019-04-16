
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f x), false) in f' 1), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f x), false) in f'), b);;

*)

(* changed spans
(7,69)-(7,73)
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
(6,3)-(7,78)
(7,5)-(7,78)
(7,6)-(7,74)
(7,14)-(7,65)
(7,18)-(7,65)
(7,51)-(7,65)
(7,69)-(7,71)
(7,69)-(7,73)
*)
