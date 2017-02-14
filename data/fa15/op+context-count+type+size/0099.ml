
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
(6,22)-(6,70)
(6,36)-(6,37)
(6,36)-(6,49)
(6,41)-(6,49)
(6,48)-(6,49)
(6,55)-(6,70)
(6,63)-(6,67)
(6,69)-(6,70)
*)

(* type error slice
(2,4)-(4,71)
(2,17)-(4,69)
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(3,15)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,55)
(4,54)-(4,55)
(6,22)-(6,70)
(6,31)-(6,49)
(6,36)-(6,37)
(6,36)-(6,49)
(6,41)-(6,42)
(6,41)-(6,44)
(6,43)-(6,44)
(6,55)-(6,61)
(6,55)-(6,70)
(6,63)-(6,67)
(6,63)-(6,70)
*)
