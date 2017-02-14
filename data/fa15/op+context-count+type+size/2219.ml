
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' b = (f b) = b in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (true, (f b)) else (false, (f b)) in
  wwhile (helper, b);;

*)

(* changed spans
(4,21)-(4,59)
(4,32)-(4,41)
(4,45)-(4,51)
(4,45)-(4,59)
(4,53)-(4,55)
(4,57)-(4,58)
*)

(* type error slice
(2,23)-(2,77)
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(4,21)-(4,59)
(4,28)-(4,41)
(4,32)-(4,41)
(4,45)-(4,51)
(4,45)-(4,59)
(4,52)-(4,59)
(4,53)-(4,55)
*)
