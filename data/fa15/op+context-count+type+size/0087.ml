
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
(6,22)-(6,68)
(6,34)-(6,35)
(6,34)-(6,47)
(6,39)-(6,42)
(6,39)-(6,47)
(6,46)-(6,47)
(6,53)-(6,59)
(6,53)-(6,68)
(6,64)-(6,68)
*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(4,54)-(4,55)
(6,22)-(6,68)
(6,34)-(6,35)
(6,34)-(6,47)
(6,39)-(6,40)
(6,39)-(6,42)
(6,41)-(6,42)
(6,53)-(6,59)
(6,53)-(6,68)
(6,61)-(6,62)
(6,61)-(6,68)
(6,64)-(6,68)
*)
