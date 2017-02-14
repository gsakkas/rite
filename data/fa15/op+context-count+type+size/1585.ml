
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((let f' f b = (f b) = b in f'), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, false) else ((f b), true) in f'), b);;

*)

(* changed spans
(5,31)-(5,59)
(5,38)-(5,53)
(5,45)-(5,53)
(5,57)-(5,59)
*)

(* type error slice
(3,3)-(3,64)
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,51)
(3,50)-(3,55)
(5,22)-(5,28)
(5,22)-(5,63)
(5,31)-(5,59)
(5,31)-(5,59)
(5,31)-(5,63)
(5,38)-(5,53)
(5,40)-(5,53)
(5,57)-(5,59)
*)
