
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
(5,17)-(5,37)
(5,18)-(5,29)
(5,27)-(5,28)
(5,31)-(5,36)
(5,32)-(5,33)
(5,34)-(5,35)
(5,41)-(5,63)
(5,49)-(5,59)
(5,50)-(5,56)
(5,57)-(5,58)
(5,61)-(5,62)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,63)
(5,13)-(5,37)
(5,17)-(5,37)
(5,41)-(5,47)
(5,41)-(5,63)
(5,48)-(5,63)
(5,49)-(5,59)
(5,50)-(5,56)
*)
