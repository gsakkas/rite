
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile ((f b), x) | (x,y) -> x;;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

*)

(* changed spans
(4,51)-(4,56)
f
VarG

*)

(* type error slice
(2,4)-(4,75)
(2,17)-(4,73)
(4,43)-(4,49)
(4,43)-(4,60)
(4,50)-(4,60)
(4,51)-(4,56)
(4,52)-(4,53)
*)
