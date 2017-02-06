
let rec wwhile (f,b) =
  let func = f b in let (value,boo) = func in if boo then wwhile f else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(3,66)-(3,67)
*)

(* type error slice
(2,4)-(3,80)
(2,17)-(3,78)
(3,3)-(3,78)
(3,3)-(3,78)
(3,14)-(3,15)
(3,14)-(3,17)
(3,14)-(3,17)
(3,16)-(3,17)
(3,21)-(3,78)
(3,21)-(3,78)
(3,39)-(3,43)
(3,47)-(3,78)
(3,47)-(3,78)
(3,47)-(3,78)
(3,50)-(3,53)
(3,59)-(3,65)
(3,59)-(3,67)
(3,59)-(3,67)
(3,66)-(3,67)
(3,73)-(3,78)
*)
