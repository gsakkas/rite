
let rec wwhile (f,b) =
  match b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,9)-(3,10)
f b
AppG [VarG]

*)

(* type error slice
(2,4)-(3,64)
(2,17)-(3,62)
(3,3)-(3,62)
(3,9)-(3,10)
(3,40)-(3,46)
(3,40)-(3,54)
(3,47)-(3,54)
(3,51)-(3,53)
*)
