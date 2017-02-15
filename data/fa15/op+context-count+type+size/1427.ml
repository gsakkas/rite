
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
(7,68)-(7,72)
(7,75)-(7,76)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(6,2)-(6,8)
(6,2)-(7,77)
(7,4)-(7,77)
(7,5)-(7,73)
(7,5)-(7,73)
(7,13)-(7,64)
(7,17)-(7,64)
(7,35)-(7,45)
(7,68)-(7,70)
(7,68)-(7,72)
*)
