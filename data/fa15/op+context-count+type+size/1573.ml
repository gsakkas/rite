
let rec wwhile (f,b) =
  match f b with | (f,(h1,h2)) -> if h2 then wwhile (f, h1) else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,3)-(3,68)
*)

(* type error slice
(2,4)-(3,70)
(2,17)-(3,68)
(3,3)-(3,68)
(3,9)-(3,10)
(3,9)-(3,12)
(3,46)-(3,52)
(3,46)-(3,59)
(3,54)-(3,55)
(3,54)-(3,59)
*)
