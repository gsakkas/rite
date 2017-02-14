
let rec wwhile (f,b) =
  match b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,8)-(3,9)
*)

(* type error slice
(2,3)-(3,63)
(2,16)-(3,61)
(3,2)-(3,61)
(3,8)-(3,9)
(3,39)-(3,45)
(3,39)-(3,53)
(3,46)-(3,53)
(3,50)-(3,52)
*)
