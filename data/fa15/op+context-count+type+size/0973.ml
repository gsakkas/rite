
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let b' = f b in (b', (b' = b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(5,22)-(5,28)
(5,22)-(5,65)
(5,31)-(5,59)
(5,31)-(5,65)
(5,42)-(5,43)
(5,48)-(5,59)
(5,53)-(5,55)
(5,53)-(5,59)
(5,58)-(5,59)
(5,64)-(5,65)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,51)-(3,57)
(3,51)-(3,64)
(3,59)-(3,60)
(3,59)-(3,64)
(5,22)-(5,28)
(5,22)-(5,65)
(5,31)-(5,59)
(5,31)-(5,65)
(5,48)-(5,59)
*)
