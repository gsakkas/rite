
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile ((f b), x) | (x,y) -> x;;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

*)

(* changed spans
(4,52)-(4,55)
(4,54)-(4,55)
*)

(* type error slice
(2,4)-(4,75)
(2,17)-(4,73)
(4,43)-(4,49)
(4,43)-(4,59)
(4,52)-(4,53)
(4,52)-(4,55)
(4,52)-(4,59)
*)
