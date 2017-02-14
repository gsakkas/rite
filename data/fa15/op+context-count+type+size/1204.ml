
let helper f b = if (f b) = b then true else false;;

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
(2,36)-(2,40)
(2,46)-(2,51)
(4,17)-(5,64)
(7,31)-(7,37)
(7,31)-(7,41)
(7,38)-(7,39)
(7,40)-(7,41)
(7,44)-(7,45)
*)

(* type error slice
(2,4)-(2,53)
(2,12)-(2,51)
(2,14)-(2,51)
(2,18)-(2,51)
(2,36)-(2,40)
(5,17)-(5,18)
(5,17)-(5,20)
(5,42)-(5,48)
(5,42)-(5,55)
(5,50)-(5,51)
(5,50)-(5,55)
(7,22)-(7,28)
(7,22)-(7,45)
(7,31)-(7,37)
(7,31)-(7,41)
(7,31)-(7,45)
*)
