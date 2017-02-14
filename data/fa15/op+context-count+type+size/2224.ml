
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper f b = (((f b) = b), (f b)) in wwhile ((helper f b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(5,14)-(5,38)
(5,23)-(5,31)
(5,23)-(5,38)
(5,30)-(5,31)
(5,35)-(5,36)
(5,35)-(5,38)
(5,37)-(5,38)
(5,44)-(5,67)
(5,53)-(5,63)
(5,60)-(5,61)
(5,66)-(5,67)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,67)
(5,14)-(5,38)
(5,16)-(5,38)
(5,23)-(5,38)
(5,44)-(5,50)
(5,44)-(5,67)
(5,53)-(5,59)
(5,53)-(5,63)
(5,53)-(5,67)
*)
