
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx x = x in wwhile (b, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,22)-(6,50)
(6,29)-(6,34)
(6,33)-(6,34)
(6,38)-(6,44)
(6,38)-(6,50)
(6,46)-(6,50)
(6,49)-(6,50)
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
(6,38)-(6,44)
(6,38)-(6,50)
(6,46)-(6,47)
(6,46)-(6,50)
(6,49)-(6,50)
*)
