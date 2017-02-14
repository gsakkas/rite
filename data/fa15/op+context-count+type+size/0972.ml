
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let q = f b in (q, (q != b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(5,22)-(5,28)
(5,22)-(5,63)
(5,31)-(5,57)
(5,31)-(5,63)
(5,41)-(5,42)
(5,47)-(5,48)
(5,47)-(5,57)
(5,51)-(5,52)
(5,56)-(5,57)
(5,62)-(5,63)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,51)-(3,57)
(3,51)-(3,64)
(3,59)-(3,60)
(3,59)-(3,64)
(5,22)-(5,28)
(5,22)-(5,63)
(5,31)-(5,57)
(5,31)-(5,63)
(5,47)-(5,57)
*)
