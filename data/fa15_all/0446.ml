
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let xx = f x in
    match xx with | xx when (xx - x) > 0 -> (x, b) | _ -> ((f x), b) in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let xx = f x in (xx, (xx = x)) in wwhile (gs, b);;

*)

(* changed spans
(9,5)-(9,69)
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
(7,3)-(10,17)
(7,10)-(9,69)
(8,5)-(9,69)
(9,5)-(9,69)
(9,29)-(9,37)
(9,35)-(9,36)
(9,45)-(9,51)
(9,46)-(9,47)
(9,49)-(9,50)
(10,3)-(10,9)
(10,3)-(10,17)
(10,10)-(10,17)
(10,11)-(10,13)
(10,15)-(10,16)
*)
