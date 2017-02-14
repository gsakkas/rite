
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile ((helper b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(6,12)-(6,20)
(6,23)-(6,24)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(6,24)
(5,14)-(5,75)
(5,18)-(5,75)
(5,34)-(5,75)
(5,50)-(5,58)
(6,3)-(6,9)
(6,3)-(6,24)
(6,12)-(6,18)
(6,12)-(6,20)
(6,12)-(6,24)
*)
