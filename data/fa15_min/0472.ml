
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = (f s) = s in
    let rec go r = if isFPoint r then r else go (f r) in
    ((go x), (isFPoint x)) in
  wwhile ((gs b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = (f s) = s in
    let rec go r = if isFPoint r then r else go (f r) in
    ((go x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(11,11)-(11,17)
gs
VarG

*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(7,3)-(11,21)
(7,10)-(10,27)
(8,5)-(10,27)
(9,5)-(10,27)
(10,5)-(10,27)
(11,3)-(11,9)
(11,3)-(11,21)
(11,10)-(11,21)
(11,11)-(11,17)
(11,12)-(11,14)
*)
