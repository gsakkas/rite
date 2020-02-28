
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = ((f s) - s) < 0 in
    let iterate (t,y) = t y in
    let rec go r =
      if isFPoint r then (r, true) else go ((iterate (x, r)), false) in
    go x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(9,5)-(12,9)
(f x , isFPoint x)
TupleG [AppG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(8,5)-(12,9)
(8,18)-(8,37)
(8,22)-(8,33)
(8,31)-(8,32)
(9,5)-(12,9)
(9,18)-(9,28)
(9,25)-(9,26)
(9,25)-(9,28)
(10,5)-(12,9)
(10,16)-(11,69)
(11,10)-(11,18)
(11,10)-(11,20)
(11,19)-(11,20)
(11,41)-(11,43)
(11,41)-(11,69)
(11,44)-(11,69)
(11,45)-(11,61)
(11,46)-(11,53)
(11,54)-(11,60)
(11,55)-(11,56)
(12,5)-(12,7)
(12,5)-(12,9)
(12,8)-(12,9)
*)
