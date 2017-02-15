
let rec wwhile (f,b) =
  match (f, b) with | (f,(h1,h2)) -> if h2 then wwhile (f, h1) else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,2)-(3,70)
(3,8)-(3,14)
(3,9)-(3,10)
*)

(* type error slice
(2,3)-(3,72)
(2,16)-(3,70)
(3,2)-(3,70)
(3,8)-(3,14)
(3,12)-(3,13)
(3,48)-(3,54)
(3,48)-(3,62)
(3,55)-(3,62)
(3,59)-(3,61)
*)
