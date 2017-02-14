
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f, b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

*)

(* changed spans
(4,9)-(4,15)
*)

(* type error slice
(3,45)-(3,51)
(3,45)-(3,58)
(3,52)-(3,58)
(3,53)-(3,54)
(4,2)-(4,8)
(4,2)-(4,15)
(4,9)-(4,15)
(4,10)-(4,11)
*)
