
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt = (f, ((f b) = b)) in wwhile (b, funt);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,68)
(6,32)-(6,48)
(6,33)-(6,34)
(6,36)-(6,47)
(6,37)-(6,42)
(6,45)-(6,46)
(6,52)-(6,68)
(6,60)-(6,61)
(6,63)-(6,67)
*)

(* type error slice
(3,2)-(4,68)
(3,12)-(3,13)
(3,12)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(6,21)-(6,68)
(6,32)-(6,48)
(6,33)-(6,34)
(6,37)-(6,42)
(6,38)-(6,39)
(6,40)-(6,41)
(6,52)-(6,58)
(6,52)-(6,68)
(6,59)-(6,68)
(6,60)-(6,61)
(6,63)-(6,67)
*)
