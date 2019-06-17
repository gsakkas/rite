
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let xx = f x in match xx with | xx when (xx - x) > 0 -> (x, b) | _ -> f x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let xx = f x in (xx, (xx = x)) in wwhile (gs, b);;

*)

(* changed spans
(8,21)-(8,78)
(xx , xx = x)
TupleG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,31)-(4,32)
(4,31)-(4,39)
(4,35)-(4,39)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(4,54)-(4,55)
(7,3)-(9,17)
(7,10)-(8,78)
(8,5)-(8,78)
(8,14)-(8,15)
(8,14)-(8,17)
(8,21)-(8,78)
(8,27)-(8,29)
(8,45)-(8,53)
(8,46)-(8,48)
(8,51)-(8,52)
(8,61)-(8,67)
(8,62)-(8,63)
(8,65)-(8,66)
(8,75)-(8,76)
(8,75)-(8,78)
(9,3)-(9,9)
(9,3)-(9,17)
(9,10)-(9,17)
(9,11)-(9,13)
(9,15)-(9,16)
*)
