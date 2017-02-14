
let rec wwhile (f,b) =
  match (f, b) with | (f,(h1,h2)) -> if h2 then f h1 else wwhile (h1, h2);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,3)-(3,73)
(3,10)-(3,11)
(3,10)-(3,14)
(3,49)-(3,50)
(3,51)-(3,53)
(3,59)-(3,73)
(3,67)-(3,69)
(3,71)-(3,73)
*)

(* type error slice
(2,4)-(3,76)
(2,17)-(3,73)
(3,3)-(3,73)
(3,10)-(3,14)
(3,13)-(3,14)
(3,59)-(3,65)
(3,59)-(3,73)
(3,67)-(3,73)
(3,71)-(3,73)
*)
