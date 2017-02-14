
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((let b' = f b in if b != b' then true else false), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(6,3)-(6,9)
(6,3)-(6,63)
(6,12)-(6,59)
(6,12)-(6,63)
(6,23)-(6,24)
(6,28)-(6,59)
(6,31)-(6,32)
(6,36)-(6,38)
(6,44)-(6,48)
(6,54)-(6,59)
(6,62)-(6,63)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,51)-(3,57)
(3,51)-(3,64)
(3,59)-(3,60)
(3,59)-(3,64)
(6,3)-(6,9)
(6,3)-(6,63)
(6,12)-(6,59)
(6,12)-(6,63)
(6,28)-(6,59)
(6,44)-(6,48)
*)
