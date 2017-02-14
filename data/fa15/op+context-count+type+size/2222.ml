
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = (((f b) = b), (f b)) in wwhile ((helper b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(5,21)-(5,29)
(5,21)-(5,36)
(5,28)-(5,29)
(5,33)-(5,34)
(5,33)-(5,36)
(5,35)-(5,36)
(5,42)-(5,63)
(5,51)-(5,57)
(5,51)-(5,59)
(5,58)-(5,59)
(5,62)-(5,63)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,63)
(5,14)-(5,36)
(5,21)-(5,36)
(5,42)-(5,48)
(5,42)-(5,63)
(5,51)-(5,57)
(5,51)-(5,59)
(5,51)-(5,63)
*)
