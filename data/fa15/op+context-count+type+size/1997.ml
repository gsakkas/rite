
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
(5,13)-(5,39)
(5,19)-(5,39)
(5,20)-(5,31)
(5,29)-(5,30)
(5,33)-(5,38)
(5,34)-(5,35)
(5,36)-(5,37)
(5,43)-(5,67)
(5,51)-(5,63)
(5,59)-(5,60)
(5,65)-(5,66)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,67)
(5,13)-(5,39)
(5,15)-(5,39)
(5,19)-(5,39)
(5,43)-(5,49)
(5,43)-(5,67)
(5,50)-(5,67)
(5,51)-(5,63)
(5,52)-(5,58)
*)
