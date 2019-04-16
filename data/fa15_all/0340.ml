
let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile (0, b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(5,30)-(5,31)
fixpointHelper f b
AppG (fromList [VarG])

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,47)-(3,53)
(3,47)-(3,62)
(3,54)-(3,62)
(3,55)-(3,56)
(5,22)-(5,28)
(5,22)-(5,35)
(5,29)-(5,35)
(5,30)-(5,31)
*)
