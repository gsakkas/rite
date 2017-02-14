
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
(6,10)-(6,20)
(6,22)-(6,23)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(6,24)
(5,13)-(5,75)
(5,17)-(5,75)
(5,33)-(5,75)
(5,48)-(5,58)
(6,2)-(6,8)
(6,2)-(6,24)
(6,9)-(6,24)
(6,10)-(6,20)
(6,11)-(6,17)
*)
