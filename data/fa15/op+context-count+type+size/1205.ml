
let helper f b = if (f b) = b then (true, b) else (false, (f b));;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f b), b);;


(* fix

let helper f b = if (f b) = b then (true, b) else (false, (f b));;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f), b);;

*)

(* changed spans
(7,29)-(7,41)
(7,43)-(7,44)
*)

(* type error slice
(2,3)-(2,66)
(2,11)-(2,64)
(2,13)-(2,64)
(2,17)-(2,64)
(2,35)-(2,44)
(5,16)-(5,17)
(5,16)-(5,19)
(5,41)-(5,47)
(5,41)-(5,55)
(5,48)-(5,55)
(5,49)-(5,50)
(7,21)-(7,27)
(7,21)-(7,45)
(7,28)-(7,45)
(7,29)-(7,41)
(7,30)-(7,36)
*)
