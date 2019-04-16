
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f, b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

*)

(* changed spans
(4,10)-(4,16)
f b
AppG (fromList [VarG])

*)

(* type error slice
(3,46)-(3,52)
(3,46)-(3,59)
(3,53)-(3,59)
(3,54)-(3,55)
(4,3)-(4,9)
(4,3)-(4,16)
(4,10)-(4,16)
(4,11)-(4,12)
*)
