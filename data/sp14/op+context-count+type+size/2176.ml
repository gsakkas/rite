
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((f f b), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,29)-(6,36)
(6,30)-(6,31)
(6,32)-(6,33)
(6,38)-(6,39)
*)

(* type error slice
(6,29)-(6,36)
(6,30)-(6,31)
(6,32)-(6,33)
*)
