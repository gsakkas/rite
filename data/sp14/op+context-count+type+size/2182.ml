
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (f, ((f b) = b), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,28)-(6,47)
(6,29)-(6,30)
(6,32)-(6,43)
*)

(* type error slice
(2,3)-(4,16)
(2,16)-(4,14)
(6,21)-(6,27)
(6,21)-(6,47)
(6,28)-(6,47)
*)
