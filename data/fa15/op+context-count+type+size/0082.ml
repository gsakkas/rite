
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt b = (f, ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,70)
(6,34)-(6,50)
(6,35)-(6,36)
(6,38)-(6,49)
(6,47)-(6,48)
(6,54)-(6,70)
(6,62)-(6,66)
(6,68)-(6,69)
*)

(* type error slice
(2,3)-(4,70)
(2,16)-(4,68)
(3,2)-(4,68)
(3,12)-(3,13)
(3,12)-(3,15)
(3,14)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,53)-(4,54)
(6,21)-(6,70)
(6,30)-(6,50)
(6,34)-(6,50)
(6,35)-(6,36)
(6,39)-(6,44)
(6,40)-(6,41)
(6,42)-(6,43)
(6,54)-(6,60)
(6,54)-(6,70)
(6,61)-(6,70)
(6,62)-(6,66)
*)
