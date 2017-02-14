
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g b = ((f b), (if (f b) = b then false else true)) in (g, b));;

*)

(* changed spans
(3,2)-(3,59)
(3,24)-(3,33)
(3,28)-(3,33)
(3,39)-(3,40)
(5,14)-(6,63)
(6,9)-(6,63)
(6,10)-(6,59)
(6,29)-(6,39)
(6,30)-(6,31)
(6,45)-(6,58)
(6,46)-(6,51)
(6,47)-(6,48)
(6,49)-(6,50)
(6,61)-(6,62)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(3,46)-(3,52)
(3,46)-(3,59)
(3,53)-(3,59)
(3,54)-(3,55)
(6,2)-(6,8)
(6,2)-(6,63)
(6,9)-(6,63)
(6,10)-(6,59)
(6,29)-(6,39)
*)
