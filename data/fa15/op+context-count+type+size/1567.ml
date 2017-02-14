
let rec wwhile (f,b) =
  match (f, b) with | (f,(h1,h2)) -> if h2 then wwhile f h1 else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,3)-(3,68)
(3,10)-(3,11)
(3,10)-(3,14)
(3,49)-(3,60)
(3,56)-(3,57)
*)

(* type error slice
(2,4)-(3,70)
(2,17)-(3,68)
(3,3)-(3,68)
(3,10)-(3,11)
(3,10)-(3,14)
(3,49)-(3,55)
(3,49)-(3,60)
(3,56)-(3,57)
*)
