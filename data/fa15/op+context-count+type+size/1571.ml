
let rec wwhile (f,b) =
  match (f, b) with | (f,(h1,h2)) -> if h2 then f h1 else wwhile (h1, h2);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,2)-(3,73)
(3,8)-(3,14)
(3,9)-(3,10)
(3,48)-(3,49)
(3,50)-(3,52)
(3,58)-(3,73)
(3,66)-(3,68)
(3,70)-(3,72)
*)

(* type error slice
(2,3)-(3,75)
(2,16)-(3,73)
(3,2)-(3,73)
(3,8)-(3,14)
(3,12)-(3,13)
(3,58)-(3,64)
(3,58)-(3,73)
(3,65)-(3,73)
(3,70)-(3,72)
*)
