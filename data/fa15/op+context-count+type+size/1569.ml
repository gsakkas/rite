
let rec wwhile (f,b) =
  match f b with | (f,(h1,h2)) -> if h2 then wwhile (f, (h1, h2)) else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,3)-(3,74)
(3,58)-(3,64)
(3,62)-(3,64)
*)

(* type error slice
(2,4)-(3,76)
(2,17)-(3,74)
(3,3)-(3,74)
(3,9)-(3,10)
(3,9)-(3,12)
(3,46)-(3,52)
(3,46)-(3,64)
(3,54)-(3,55)
(3,54)-(3,64)
*)
