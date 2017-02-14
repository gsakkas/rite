
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let g x = f b in ((f b), ((f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = let g x = let n = f x in (n, (n = x)) in wwhile (g, b);;

*)

(* changed spans
(5,22)-(5,28)
(5,22)-(5,72)
(5,31)-(5,66)
(5,31)-(5,72)
(5,41)-(5,44)
(5,43)-(5,44)
(5,50)-(5,51)
(5,50)-(5,53)
(5,52)-(5,53)
(5,58)-(5,59)
(5,58)-(5,61)
(5,60)-(5,61)
(5,65)-(5,66)
(5,71)-(5,72)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,64)-(3,70)
(3,64)-(3,77)
(3,72)-(3,73)
(3,72)-(3,77)
(5,22)-(5,28)
(5,22)-(5,72)
(5,31)-(5,66)
(5,31)-(5,72)
(5,50)-(5,66)
*)
