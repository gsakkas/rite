
let helper f b = if (f b) = b then true else false;;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper f b = if (f b) = b then (true, b) else (false, (f b));;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f), b);;

*)

(* changed spans
(2,35)-(2,39)
(2,45)-(2,50)
(4,16)-(5,63)
(7,30)-(7,36)
(7,37)-(7,43)
(7,38)-(7,39)
(7,46)-(7,47)
*)

(* type error slice
(2,3)-(2,52)
(2,11)-(2,50)
(2,20)-(2,25)
(2,21)-(2,22)
(7,29)-(7,44)
(7,30)-(7,36)
(7,37)-(7,43)
*)
