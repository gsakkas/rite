
let rec wwhile (f,b) =
  match f b with | (f,(h1,h2)) -> if h2 then wwhile (f, h1) else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,2)-(3,67)
*)

(* type error slice
(2,3)-(3,69)
(2,16)-(3,67)
(3,2)-(3,67)
(3,8)-(3,9)
(3,8)-(3,11)
(3,45)-(3,51)
(3,45)-(3,59)
(3,52)-(3,59)
(3,53)-(3,54)
*)
