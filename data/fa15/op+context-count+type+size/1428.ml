
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
(5,29)-(5,59)
(5,37)-(5,52)
(5,43)-(5,52)
(5,56)-(5,58)
*)

(* type error slice
(3,2)-(3,63)
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(5,21)-(5,27)
(5,21)-(5,63)
(5,28)-(5,63)
(5,29)-(5,59)
(5,29)-(5,59)
(5,37)-(5,52)
(5,39)-(5,52)
(5,56)-(5,58)
*)
