
let notEqual x y = (x = y) = false;;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc b = ((f b), (notEqual b f b)) in wwhile (newFunc, b);;


(* fix

let notEqual x y = (x = y) = false;;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc b = ((f b), (notEqual b (f b))) in wwhile (newFunc, b);;

*)

(* changed spans
(9,27)-(9,43)
notEqual b (f b)
AppG [VarG,AppG [EmptyG]]

*)

(* type error slice
(2,4)-(2,37)
(2,14)-(2,35)
(2,16)-(2,35)
(2,20)-(2,35)
(9,27)-(9,43)
(9,28)-(9,36)
*)
