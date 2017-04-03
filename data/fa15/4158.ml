
let rec wwhile (f,b) = match b with | b -> wwhile f b;;


(* fix

let rec wwhile (f,b) =
  match b with | b -> if (f b) = (b, true) then wwhile (f, b);;

*)

(* changed spans
(2,43)-(2,49)
(2,43)-(2,53)
(2,50)-(2,51)
*)

(* type error slice
(2,3)-(2,55)
(2,16)-(2,53)
(2,43)-(2,49)
(2,43)-(2,53)
(2,50)-(2,51)
*)

(* all spans
(2,16)-(2,53)
(2,23)-(2,53)
(2,29)-(2,30)
(2,43)-(2,53)
(2,43)-(2,49)
(2,50)-(2,51)
(2,52)-(2,53)
*)
