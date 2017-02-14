
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
(6,2)-(6,8)
(6,2)-(6,63)
(6,9)-(6,63)
(6,10)-(6,59)
(6,22)-(6,23)
(6,27)-(6,58)
(6,30)-(6,31)
(6,35)-(6,37)
(6,43)-(6,47)
(6,53)-(6,58)
(6,61)-(6,62)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,50)-(3,56)
(3,50)-(3,64)
(3,57)-(3,64)
(3,58)-(3,59)
(6,2)-(6,8)
(6,2)-(6,63)
(6,9)-(6,63)
(6,10)-(6,59)
(6,27)-(6,58)
(6,43)-(6,47)
*)
