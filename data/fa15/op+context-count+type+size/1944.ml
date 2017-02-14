
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b), (b = (f b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,49)
(5,51)-(5,52)
*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,44)-(3,50)
(3,44)-(3,58)
(3,51)-(3,58)
(3,52)-(3,53)
(5,21)-(5,27)
(5,21)-(5,53)
(5,28)-(5,53)
(5,29)-(5,49)
*)
