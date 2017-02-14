
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, false) else ((f b), true) in f' b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, false) else ((f b), true) in f'), b);;

*)

(* changed spans
(7,69)-(7,73)
(7,76)-(7,77)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,51)
(3,50)-(3,55)
(6,3)-(6,9)
(6,3)-(7,77)
(7,7)-(7,73)
(7,7)-(7,73)
(7,7)-(7,77)
(7,14)-(7,64)
(7,18)-(7,64)
(7,37)-(7,45)
(7,69)-(7,71)
(7,69)-(7,73)
*)
