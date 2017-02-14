
let rec wwhile (f,b) =
  match (f, b) with | (f,(h1,h2)) -> if h2 then wwhile f h1 else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,2)-(3,67)
(3,8)-(3,14)
(3,9)-(3,10)
(3,48)-(3,59)
(3,55)-(3,56)
*)

(* type error slice
(2,3)-(3,69)
(2,16)-(3,67)
(3,2)-(3,67)
(3,8)-(3,14)
(3,9)-(3,10)
(3,48)-(3,54)
(3,48)-(3,59)
(3,55)-(3,56)
*)
