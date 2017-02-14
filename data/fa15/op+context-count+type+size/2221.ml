
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' b = (f b) = b in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (true, (f b)) else (false, (f b)) in
  wwhile (helper, b);;

*)

(* changed spans
(4,22)-(4,59)
(4,34)-(4,42)
(4,46)-(4,52)
(4,46)-(4,59)
(4,54)-(4,56)
(4,58)-(4,59)
*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(4,22)-(4,59)
(4,29)-(4,42)
(4,34)-(4,42)
(4,46)-(4,52)
(4,46)-(4,59)
(4,54)-(4,56)
(4,54)-(4,59)
*)
