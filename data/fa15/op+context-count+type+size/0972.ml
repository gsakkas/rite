
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let q = f b in (q, (q != b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(5,21)-(5,27)
(5,21)-(5,63)
(5,28)-(5,63)
(5,29)-(5,59)
(5,40)-(5,41)
(5,45)-(5,58)
(5,46)-(5,47)
(5,50)-(5,51)
(5,55)-(5,56)
(5,61)-(5,62)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,50)-(3,56)
(3,50)-(3,64)
(3,57)-(3,64)
(3,58)-(3,59)
(5,21)-(5,27)
(5,21)-(5,63)
(5,28)-(5,63)
(5,29)-(5,59)
(5,45)-(5,58)
*)
