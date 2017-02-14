
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
(2,36)-(2,40)
(2,46)-(2,51)
(4,17)-(5,64)
(7,31)-(7,37)
(7,39)-(7,40)
(7,39)-(7,43)
(7,47)-(7,48)
*)

(* type error slice
(2,4)-(2,53)
(2,12)-(2,51)
(2,22)-(2,23)
(2,22)-(2,25)
(7,31)-(7,37)
(7,31)-(7,43)
(7,39)-(7,43)
*)
