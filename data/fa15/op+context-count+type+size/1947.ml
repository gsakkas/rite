
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
(6,11)-(6,61)
(6,18)-(6,39)
(6,48)-(6,56)
(6,48)-(6,61)
(6,52)-(6,56)
*)

(* type error slice
(6,11)-(6,61)
(6,18)-(6,39)
(6,36)-(6,37)
(6,36)-(6,39)
(6,38)-(6,39)
(6,48)-(6,50)
(6,48)-(6,56)
(6,52)-(6,53)
(6,52)-(6,56)
*)
