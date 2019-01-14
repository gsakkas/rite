
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
(9,26)-(9,42)
notEqual b (f b)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(9,38)-(9,39)
f b
AppG (fromList [VarG])

*)
