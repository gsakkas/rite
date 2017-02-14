
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let rec funt x = (f b) = b in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let rec funt x = (b, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(6,38)-(6,47)
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
(6,21)-(6,67)
(6,34)-(6,47)
(6,38)-(6,47)
(6,51)-(6,57)
(6,51)-(6,67)
(6,58)-(6,67)
(6,59)-(6,63)
*)
