
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let f' b = ((f b), (b = (f b))) in ((f' (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,9)-(6,62)
(6,17)-(6,41)
(6,45)-(6,61)
(6,46)-(6,57)
(6,50)-(6,56)
*)

(* type error slice
(6,9)-(6,62)
(6,17)-(6,41)
(6,34)-(6,39)
(6,35)-(6,36)
(6,37)-(6,38)
(6,46)-(6,57)
(6,47)-(6,49)
(6,50)-(6,56)
(6,51)-(6,52)
*)
